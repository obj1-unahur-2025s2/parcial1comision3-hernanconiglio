import pilotos.*
object eva01 {
    var at = 2110
    var energia = 100
    method at() = at
    method puedeSincronizarse(unPiloto) {
        return unPiloto.entrenamiento() >= 4
        && energia > 30
    }
    method efectoDeSincronizarse(unPiloto) {
        if(self.puedeSincronizarse(unPiloto)) {
            energia = (energia - 25).max(0)
            at = (at + 1).min(2150)
        }
    }

    method puntosQueOtorga() = 2
    method recargarBateria(horas) {
        energia = (energia + 30 * 0.max(horas)).min(100)
    }
}

object eva02 {
    var energia = 100
    var modoDeCombate = estandar
    method energia() = energia
    method at() = 2114
    method cambiarModoDeCombate(nuevoModo) {modoDeCombate = nuevoModo}
    method puedeSincronizarse(unPiloto) {
        return unPiloto.entrenamiento() >= 2
        && energia > 20
    }
    method efectoDeSincronizarse(unPiloto) {
        if(self.puedeSincronizarse(unPiloto)) {
            energia = (energia - modoDeCombate.consumo()).max(0)
        }    
    }
    method puntosQueOtorga() = modoDeCombate.puntosQueOtorga()
    method recargarBateria(horas) {
        energia = (energia + 25 * 0.max(horas)).min(100)
    }
}

object estandar {
    method consumo() = 10
    method puntosQueOtorga() = 1
}

object ataque {
    method consumo() = 20
    method puntosQueOtorga() = 3
}

object berserk {
    method consumo() = 35
    method puntosQueOtorga() = 6
}

object eva00 {
    var at = 2100
    method at() = at
    method agregarAt(unValor) {
        at = ((at + unValor.max(0)).max(2100)).min(2150)
    }
    method puedeSincronizarse(unPiloto) = true
    method efectoDeSincronizarse(unPiloto) {}
    method puntosQueOtorga() = 1
    method recargarBateria(horas) {}
}

object ningunEva {
    method at() = 0
    method puedeSincronizarse(unPiloto) = false
    method efectoDeSincronizarse(unPiloto) {}
    method puntosQueOtorga() = 0
    method recargarBateria(horas) {}
}