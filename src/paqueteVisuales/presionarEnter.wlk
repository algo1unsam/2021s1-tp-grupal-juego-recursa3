import wollok.game.*
import paqueteSecundario.pantallas.*

class VisualPresionaEnter inherits Pantalla {

	var property index
	var property subir

	method asignarIndex() {
		if (subir) {
			index++
		} else {
			index--
		}
		if (index == 9) {
			subir = false
		}
		if (index == 0) {
			subir = true
		}
	}

	override method iniciar() {
		index = 0
		subir = true
		game.addVisualIn(self, game.origin())
	}

}

object visualPresionaEnterParaContinuar inherits VisualPresionaEnter {

	override method iniciar() {
		super()
		game.onTick(50, "presionaEnterParaContinuar", { self.asignarIndex()})
	}

	override method image() {
		return "presionarEnterParaContinuar/" + index + ".png"
	}

	override method cerrar() {
		game.removeTickEvent("presionaEnterParaContinuar")
	}

}

object visualPresionaEnterParaVolver inherits VisualPresionaEnter {

	override method iniciar() {
		super()
		game.onTick(50, "presionaEnterParaVolver", { self.asignarIndex()})
	}

	override method image() {
		return "presionarEnterParaVolver/" + index + ".png"
	}

	override method cerrar() {
		game.removeTickEvent("presionaEnterParaVolver")
	}

}

