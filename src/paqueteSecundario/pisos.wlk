import wollok.game.*
import paquetePrimario.imagen.*

class Piso inherits Imagen {

	method agregarPisoCompleto() {
		game.addVisual(new Piso(position = game.at(1, 1), imagen = "pisos/PisoCompleto.png"))
	}

}

object pisos inherits Piso{

	method agregarPisosNivel1() {
		self.agregarPisoCompleto()
	}

	method agregarPisosNivel2() {
		self.agregarPisoCompleto()
	}
	
	method agregarPisosNivel3() {
		self.agregarPisoCompleto()
	}

}

