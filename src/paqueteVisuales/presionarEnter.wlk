import wollok.game.*
import paqueteSecundario.pantallas.*

class PantallaPresionaEnter inherits Pantalla {

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
		game.onTick(50, "presionaEnterParaContinuar", { const pantalla = pantallaPresionaEnterParaContinuar.pantallaPresionaEnterParaContinuarLista().get(index)
			game.addVisualIn(pantalla, game.origin())
			game.schedule(51, { game.removeVisual(pantalla)})
			self.asignarIndex()
		})
	}

	method borrarOnTickPresionaEnterParaContinuar() {
		if (subir and index != 0 or index == 9) {
			game.addVisualIn(pantallaPresionaEnterParaContinuar.pantallaPresionaEnterParaContinuarLista().get(index - 1), game.origin())
		} else {
			game.addVisualIn(pantallaPresionaEnterParaContinuar.pantallaPresionaEnterParaContinuarLista().get(index + 1), game.origin())
		}
		game.removeTickEvent("presionaEnterParaContinuar")
	}

	method presionaEnterParaVolver() {
		index = 0
		subir = true
		game.onTick(50, "presionaEnterParaVolver", { const pantalla = pantallaPresionaEnterParaVolver.pantallaPresionaEnterParaVolverLista().get(index)
			game.addVisualIn(pantalla, game.origin())
			game.schedule(51, { game.removeVisual(pantalla)})
			self.asignarIndex()
		})
	}

	method borrarOnTickPresionaEnterParaVolver() {
		if (subir and index != 0 or index == 9) {
			game.addVisualIn(pantallaPresionaEnterParaVolver.pantallaPresionaEnterParaVolverLista().get(index - 1), game.origin())
		} else {
			game.addVisualIn(pantallaPresionaEnterParaVolver.pantallaPresionaEnterParaVolverLista().get(index + 1), game.origin())
		}
		game.removeTickEvent("presionaEnterParaVolver")
	}

}

object pantallaPresionaEnterParaContinuar inherits PantallaPresionaEnter(index = 0) {

	const property pantallaPresionaEnterParaContinuarLista = [ pantallaPresionaEnterParaContinuar0, pantallaPresionaEnterParaContinuar1, pantallaPresionaEnterParaContinuar2, pantallaPresionaEnterParaContinuar3, pantallaPresionaEnterParaContinuar4, pantallaPresionaEnterParaContinuar5, pantallaPresionaEnterParaContinuar6, pantallaPresionaEnterParaContinuar7, pantallaPresionaEnterParaContinuar8, pantallaPresionaEnterParaContinuar9 ]

}

object pantallaPresionaEnterParaContinuar0 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/0.png") {

}

object pantallaPresionaEnterParaContinuar1 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/1.png") {

}

object pantallaPresionaEnterParaContinuar2 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/2.png") {

}

object pantallaPresionaEnterParaContinuar3 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/3.png") {

}

object pantallaPresionaEnterParaContinuar4 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/4.png") {

}

object pantallaPresionaEnterParaContinuar5 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/5.png") {

}

object pantallaPresionaEnterParaContinuar6 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/6.png") {

}

object pantallaPresionaEnterParaContinuar7 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/7.png") {

}

object pantallaPresionaEnterParaContinuar8 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/8.png") {

}

object pantallaPresionaEnterParaContinuar9 inherits PantallaPresionaEnter(imagen = "presionarEnterParaContinuar/9.png") {

}

object pantallaPresionaEnterParaVolver inherits PantallaPresionaEnter(index = 0) {

	const property pantallaPresionaEnterParaVolverLista = [ pantallaPresionaEnterParaVolver0, pantallaPresionaEnterParaVolver1, pantallaPresionaEnterParaVolver2, pantallaPresionaEnterParaVolver3, pantallaPresionaEnterParaVolver4, pantallaPresionaEnterParaVolver5, pantallaPresionaEnterParaVolver6, pantallaPresionaEnterParaVolver7, pantallaPresionaEnterParaVolver8, pantallaPresionaEnterParaVolver9 ]

}

object pantallaPresionaEnterParaVolver0 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/0.png") {

}

object pantallaPresionaEnterParaVolver1 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/1.png") {

}

object pantallaPresionaEnterParaVolver2 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/2.png") {

}

object pantallaPresionaEnterParaVolver3 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/3.png") {

}

object pantallaPresionaEnterParaVolver4 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/4.png") {

}

object pantallaPresionaEnterParaVolver5 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/5.png") {

}

object pantallaPresionaEnterParaVolver6 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/6.png") {

}

object pantallaPresionaEnterParaVolver7 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/7.png") {

}

object pantallaPresionaEnterParaVolver8 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/8.png") {

}

object pantallaPresionaEnterParaVolver9 inherits PantallaPresionaEnter(imagen = "presionarEnterParaVolver/9.png") {

}

