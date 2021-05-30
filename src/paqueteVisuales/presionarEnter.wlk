import wollok.game.*
import paqueteSecundario.pantallas.*

class PantallaPresionaEnterParaContinuar inherits Pantalla {

	var property index
	var property subir = true
	var property apretoAntes = false

	override method iniciar() {
		game.addVisualIn(self, game.origin())
	}

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

	method presionaEnterParaContinuar() {
		index = 0
		subir = true

		game.onTick(50, "presionaEnterParaContinuar", {
			const pantalla = pantallaPresionaEnterParaContinuar.pantallaPresionaEnterParaContinuarLista().get(index)
			game.addVisualIn(pantalla, game.origin())
			game.schedule(51, { game.removeVisual(pantalla)})
			self.asignarIndex()
		})
	}

	method borrarOnTick() {
		if(subir and index != 0 or index == 9){
			game.addVisualIn(pantallaPresionaEnterParaContinuar.pantallaPresionaEnterParaContinuarLista().get(index - 1), game.origin())
		}else {
			game.addVisualIn(pantallaPresionaEnterParaContinuar.pantallaPresionaEnterParaContinuarLista().get(index + 1), game.origin())
		}
		game.removeTickEvent("presionaEnterParaContinuar")
	}
}

object pantallaPresionaEnterParaContinuar inherits PantallaPresionaEnterParaContinuar(index = 0) {

	const property pantallaPresionaEnterParaContinuarLista = [ pantallaPresionaEnterParaContinuar0, pantallaPresionaEnterParaContinuar1, pantallaPresionaEnterParaContinuar2, pantallaPresionaEnterParaContinuar3, pantallaPresionaEnterParaContinuar4, pantallaPresionaEnterParaContinuar5, pantallaPresionaEnterParaContinuar6, pantallaPresionaEnterParaContinuar7, pantallaPresionaEnterParaContinuar8, pantallaPresionaEnterParaContinuar9 ]

}

object pantallaPresionaEnterParaContinuar0 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/0.png") {

}

object pantallaPresionaEnterParaContinuar1 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/1.png") {

}

object pantallaPresionaEnterParaContinuar2 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/2.png") {

}

object pantallaPresionaEnterParaContinuar3 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/3.png") {

}

object pantallaPresionaEnterParaContinuar4 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/4.png") {

}

object pantallaPresionaEnterParaContinuar5 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/5.png") {

}

object pantallaPresionaEnterParaContinuar6 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/6.png") {

}

object pantallaPresionaEnterParaContinuar7 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/7.png") {

}

object pantallaPresionaEnterParaContinuar8 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/8.png") {

}

object pantallaPresionaEnterParaContinuar9 inherits PantallaPresionaEnterParaContinuar(imagen = "presionarEnterParaContinuar/9.png") {

}

