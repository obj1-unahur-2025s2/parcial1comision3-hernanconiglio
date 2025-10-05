import  evas.*


object shinji {
    var entrenamiento = 2
    var estaDescansado = true
    const evasSincronizados = []
    method descansar() {estaDescansado = true}
    method entrenamiento() = entrenamiento
    method puedeSincronizarse(unEva) = estaDescansado && unEva.puedeSincronizarse(self)
    method efectoDeSincronizarse(unEva) {
        if(self.puedeSincronizarse(unEva)) {
            evasSincronizados.add(unEva)
            entrenamiento = entrenamiento + unEva.puntosQueOtorga()
            estaDescansado = false
        }
    }
    method estaSatisfecho(evasDelCuartel) = evasDelCuartel.difference(evasSincronizados.asSet()).isEmpty() 
}

object asuka {
    var entrenamiento = 5
    var ultimoEvaSincronizado = ningunEva
    method entrenamiento() = entrenamiento
    method puedeSincronizarse(unEva) = unEva.puedeSincronizarse(self)
    method efectoDeSincronizarse(unEva) {
        if(self.puedeSincronizarse(unEva)) {
            ultimoEvaSincronizado = unEva
            entrenamiento = entrenamiento + unEva.puntosQueOtorga()
        }
    }
    method estaSatisfecho(evasDelCuartel) = ultimoEvaSincronizado.at() > 2115
}

object rei {
    var entrenamiento = 0
    var cantidadDeSincronizaciones = 0
    method entrenamiento() = entrenamiento
    method puedeSincronizarse(unEva) = unEva.puedeSincronizarse(self) 
                                        && unEva.at() >= 2110 
                                        && cantidadDeSincronizaciones < 5
    method efectoDeSincronizarse(unEva) {
        if(self.puedeSincronizarse(unEva)) {
            cantidadDeSincronizaciones += 1
            entrenamiento = entrenamiento + unEva.puntosQueOtorga()
        }
    }
    method estaSatisfecho(evasDelCuartel) = cantidadDeSincronizaciones > 0
}