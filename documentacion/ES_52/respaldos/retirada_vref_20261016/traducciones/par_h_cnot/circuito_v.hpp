// Generated V wiring; code: HL3. No internal outcome register.
// Victor Estrada Diaz, ES_52. https://estradad.es/licencia.php
#pragma once
#include <chrono>
#include <mutex>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace qasm_v {
struct Operacion {
    std::string nombre;
    std::vector<int> puertos;
    double angulo;
    bool tiene_angulo;
};
struct Plan {
    int unidades;
    std::vector<int> preparacion;
    std::vector<Operacion> operaciones;
};
struct Realizacion {
    virtual ~Realizacion() = default;
    virtual void preparar(const Plan&) = 0;
    virtual std::vector<int> disparar(std::chrono::steady_clock::time_point) = 0;
};
inline Plan plan() {
    return {2, std::vector<int>(2, 0), {
        {"h", {0}, 0.0, false},
        {"cnot", {0, 1}, 0.0, false}
    }};
}
inline std::vector<std::pair<int, int>> medidas() { return {{0, 0}, {1, 1}}; }
class MaquinaV {
    Realizacion& realizacion_;
    std::mutex mutex_;
    bool consumida_ = false;
    bool leida_ = false;
    std::vector<int> salida_; // Only populated by measurement, never before.
    std::chrono::steady_clock::time_point t0_;
public:
    explicit MaquinaV(Realizacion& r) : realizacion_(r) { r.preparar(plan()); }
    MaquinaV(const MaquinaV&) = delete;
    MaquinaV& operator=(const MaquinaV&) = delete;
    std::vector<std::string> estado_observado() {
        std::lock_guard<std::mutex> guard(mutex_);
        if (!leida_) return std::vector<std::string>(2, "@");
        std::vector<std::string> out;
        for (int bit : salida_) out.push_back(std::to_string(bit));
        return out;
    }
    std::vector<int> medir() {
        std::lock_guard<std::mutex> guard(mutex_);
        if (leida_) return salida_;
        if (consumida_) throw std::runtime_error("Disparo consumido; no se repite");
        consumida_ = true;
        t0_ = std::chrono::steady_clock::now();
        auto leidos = realizacion_.disparar(t0_);
        if (leidos.size() != 2) throw std::runtime_error("Lectura incompleta");
        for (int b : leidos)
            if (b != 0 && b != 1) throw std::runtime_error("Lectura no binaria");
        salida_ = std::move(leidos);
        leida_ = true;
        return salida_;
    }
    std::chrono::steady_clock::time_point instante_medida() {
        std::lock_guard<std::mutex> guard(mutex_);
        if (!consumida_) throw std::runtime_error("Todavia no se ha disparado");
        return t0_;
    }
};
} // namespace qasm_v
