import wollok.game.*
import paquetePrimario.imagen.*
import paqueteSecundario.sombras.*

class Reja inherits Imagen {

// override method esAtravesable() = false
}

object rejas {

	method agregarRejasNivel1() {
		game.addVisual(rejaAzulNivel1)
		game.addVisual(rejaVerdeNivel1)
		game.addVisual(rejaRojaNivel1)
	}

	method agregarRejasNivel2() {
		game.addVisual(rejaAzulNivel2)
		game.addVisual(rejaVerdeNivel2)
		game.addVisual(rejaRojaNivel2)
	}

	method agregarRejasNivel3() {
		game.addVisual(rejaAzulNivel3)
		game.addVisual(rejaVerdeNivel3)
		game.addVisual(rejaRojaNivel3)
	}

}

object rejaAzulNivel1 inherits Reja(position = game.at(5, 5), imagen = "rejas/azul.png") {

	override method interactuarConObjeto() {
		sombras.agregarSombra2Nivel1()
		return null
	}

}

object rejaVerdeNivel1 inherits Reja(position = game.at(7, 5), imagen = "rejas/verde.png") {

	override method interactuarConObjeto() {
		sombras.agregarSombra3Nivel1()
		return null
	}

}

object rejaRojaNivel1 inherits Reja(position = game.at(15, 7), imagen = "rejas/roja.png") {

	override method interactuarConObjeto() {
		sombras.removerSombra3Nivel1()
		return null
	}

}

object rejaAzulNivel2 inherits Reja(position = game.at(17, 7), imagen = "rejas/azul.png") {

	override method interactuarConObjeto() {
		sombras.agregarSombra2Nivel2()
		return null
	}

}

object rejaVerdeNivel2 inherits Reja(position = game.at(1, 3), imagen = "rejas/verde.png") {

	override method interactuarConObjeto() {
		sombras.agregarSombra3Nivel2()
		return null
	}

}

object rejaRojaNivel2 inherits Reja(position = game.at(6, 9), imagen = "rejas/roja.png") {

	override method interactuarConObjeto() {
		sombras.removerSombra3Nivel2()
		return null
	}

}

object rejaAzulNivel3 inherits Reja(position = game.at(9, 4), imagen = "rejas/azul.png") {

	override method interactuarConObjeto() {
		sombras.agregarSombra2Nivel3()
		return null
	}

}

object rejaVerdeNivel3 inherits Reja(position = game.at(17, 11), imagen = "rejas/verde.png") {

	override method interactuarConObjeto() {
		sombras.agregarSombra3Nivel3()
		return null
	}

}

object rejaRojaNivel3 inherits Reja(position = game.at(1, 9), imagen = "rejas/roja.png") {

	override method interactuarConObjeto() {
		sombras.agregarSombra4Nivel3()
		return null
	}

}

