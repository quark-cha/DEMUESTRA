# PUBLICAR/publicar/FTPClient.py
import os
import posixpath
from ftplib import FTP, error_perm
from pathlib import Path
from typing import Optional, Union
from .env import env  # <--- CAMBIADO

class FTPClient:
    def __init__(self, host: Optional[str] = None, user: Optional[str] = None,
                 password: Optional[str] = None, port: int = 21,
                 timeout: int = 30, env_prefix: str = "FTP"):
        if host is None:
            env.require(f"{env_prefix}_HOST")
            self.host = getattr(env, f"{env_prefix}_HOST", None)
        else:
            self.host = host
        if user is None:
            env.require(f"{env_prefix}_USER")
            self.user = getattr(env, f"{env_prefix}_USER", None)
        else:
            self.user = user
        if password is None:
            env.require(f"{env_prefix}_PASSWORD")
            self.password = getattr(env, f"{env_prefix}_PASSWORD", None)
        else:
            self.password = password
        if not self.host:
            raise ValueError(f"No se pudo obtener {env_prefix}_HOST")
        self.port = port
        self.timeout = timeout
        self._ftp = None

    def connect(self) -> FTP:
        if self._ftp is None:
            try:
                self._ftp = FTP()
                self._ftp.connect(self.host, self.port, self.timeout)
                self._ftp.login(self.user, self.password)
                if self._ftp.sock is not None:
                    self._ftp.sock.settimeout(self.timeout)
            except Exception as e:
                self._ftp = None
                raise ConnectionError(f"FTP connection failed: {e}")
        return self._ftp

    def upload(self, local_path, remote_path, binary=True):
        ftp = self.connect()
        local_path = Path(local_path)
        if not local_path.exists():
            raise FileNotFoundError(f"Local file not found: {local_path}")
        remote_dir = posixpath.dirname(str(remote_path).replace("\\", "/"))
        if remote_dir:
            self.mkdir(remote_dir)
        with open(local_path, 'rb' if binary else 'r') as f:
            if binary:
                ftp.storbinary(f'STOR {remote_path}', f)
            else:
                ftp.storlines(f'STOR {remote_path}', f)

    def download(self, remote_path, local_path, binary=True):
        ftp = self.connect()
        local_path = Path(local_path)
        with open(local_path, 'wb' if binary else 'w') as f:
            if binary:
                ftp.retrbinary(f'RETR {remote_path}', f.write)
            else:
                ftp.retrlines(f'RETR {remote_path}', f.write)

    def listdir(self, remote_path="."):
        ftp = self.connect()
        return ftp.nlst(remote_path)

    def mkdir(self, remote_path):
        ftp = self.connect()
        parts = remote_path.split('/')
        current = ""
        for part in parts:
            if not part: continue
            current += "/" + part
            try:
                ftp.mkd(current)
            except error_perm as e:
                if "550" not in str(e): raise

    def delete(self, remote_path):
        ftp = self.connect()
        ftp.delete(remote_path)

    def rmdir(self, remote_path):
        ftp = self.connect()
        ftp.rmd(remote_path)

    def close(self):
        if self._ftp:
            try:
                self._ftp.quit()
            except:
                self._ftp.close()
            self._ftp = None

    def __enter__(self):
        self.connect()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()

    def __repr__(self):
        return f"<FTPClient host={self.host} user={self.user}>"
