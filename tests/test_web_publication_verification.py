import contextlib
import hashlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from ftplib import error_perm


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "vendor" / "PUBLICAR"))
from PackPublica.WebPublisher import WebPublisher


class MemoryFTP:
    def __init__(self):
        self.files = {}
        self.uploads = []
        self.fail_upload = False
        self.keep_old_pdf = False

    def upload(self, local, remote):
        self.uploads.append(remote)
        if self.fail_upload:
            raise ConnectionError("upload failed")
        if not (self.keep_old_pdf and remote.endswith(".pdf")):
            self.files[remote] = Path(local).read_bytes()

    def download(self, remote, local):
        if remote not in self.files:
            raise error_perm("550 missing file")
        Path(local).write_bytes(self.files[remote])

    def delete(self, remote):
        del self.files[remote]


class WebPublicationVerificationTests(unittest.TestCase):
    def make_publisher(self, folder, ftp):
        (folder / "ES_46_RV6.md").write_text("# Source", encoding="utf-8")
        (folder / "ES_46_RV6.pdf").write_bytes(b"corrected PDF")
        return WebPublisher(ftp, folder, "/project", extensions={".pdf"}, forzado=True)

    def test_upload_failure_reaches_caller(self):
        with tempfile.TemporaryDirectory() as directory:
            ftp = MemoryFTP()
            ftp.fail_upload = True
            publisher = self.make_publisher(Path(directory), ftp)
            with contextlib.redirect_stdout(io.StringIO()), self.assertRaises(ConnectionError):
                publisher.sync()
            self.assertNotIn("/project/hashes.json", ftp.files)

    def test_old_remote_pdf_is_detected_before_inventory_update(self):
        with tempfile.TemporaryDirectory() as directory:
            ftp = MemoryFTP()
            ftp.files["/project/ES_46_RV6.pdf"] = b"old PDF"
            ftp.keep_old_pdf = True
            publisher = self.make_publisher(Path(directory), ftp)
            with contextlib.redirect_stdout(io.StringIO()), self.assertRaisesRegex(RuntimeError, "ES_46_RV6.pdf"):
                publisher.sync()
            self.assertNotIn("/project/hashes.json", ftp.files)

    def test_success_verifies_remote_pdf_and_updates_inventory(self):
        with tempfile.TemporaryDirectory() as directory:
            ftp = MemoryFTP()
            publisher = self.make_publisher(Path(directory), ftp)
            with contextlib.redirect_stdout(io.StringIO()):
                result = publisher.sync()
            self.assertTrue(result["success"])
            self.assertEqual(ftp.files["/project/ES_46_RV6.pdf"], b"corrected PDF")
            inventory = json.loads(ftp.files["/project/hashes.json"])
            self.assertEqual(inventory["ES_46_RV6.pdf"], hashlib.md5(b"corrected PDF").hexdigest())


if __name__ == "__main__":
    unittest.main()
