import pilotos.*
import evas.*


object nerv {
    const evas = #{}
    const pilotos = #{}

    method evas() = evas
    method agregarEva(unEva) {
        evas.add(unEva)
    }

    method agregarPiloto(unPiloto) {
        pilotos.add(unPiloto)
    }

    method eliminarEva(unEva) {
        evas.remove(unEva)
    }

    method eliminarPiloto(unPiloto) {
        pilotos.remove(unPiloto)
    }

    method sincronizar(unEva,unPiloto) {
        unPiloto.efectoDeSincronizarse(unEva)
        unEva.efectoDeSincronizarse(unPiloto)

    }

    method sincronizarATodosLosEvas(unPiloto) {
        evas.forEach({
            e => self.sincronizar(e, unPiloto)
        })
    }

    method promedioPuntosEntrenamiento() {
        return
        pilotos.average({p => p.entrenamiento()})
    }

    method pilotoConMasPuntos() {
        return
        pilotos.max({p => p.entrenamiento()})
    } 

    method valoresDeAt() = evas.map({e => e.at()})

    method evasQuePuedeSincronizar(unPiloto) {
        return
        evas.filter({e => e.puedeSincronizarse(unPiloto) && unPiloto.puedeSincronizarse(e)})
    }

    method todosLosPilotosPuedenSincronizar() {
        return
        pilotos.all({p => !self.evasQuePuedeSincronizar(p).isEmpty()})
    }

    method estaSatisfecho(unPiloto) = unPiloto.estaSatisfecho(evas)
    
}