import wollok.game.*
import paquetePrimario.imagen.*

class Reja inherits Imagen {

	//override method esAtravesable() = false

}

object rejas {

	method agregarRejasNivel1() {
		game.addVisual(new Reja(position = game.at(5, 5), imagen = "rejas/azul.png"))
		game.addVisual(new Reja(position = game.at(7, 5), imagen = "rejas/verde.png"))
		game.addVisual(new Reja(position = game.at(15, 7), imagen = "rejas/roja.png"))
	}

	method agregarRejasNivel2() {
		game.addVisual(new Reja(position = game.at(17, 6), imagen = "rejas/azul.png"))
		game.addVisual(new Reja(position = game.at(1, 2), imagen = "rejas/verde.png"))
		game.addVisual(new Reja(position = game.at(6, 9), imagen = "rejas/roja.png"))
	}

	method agregarRejasNivel3() {
		game.addVisual(new Reja(position = game.at(9,4), imagen = "rejas/azul.png"))
		game.addVisual(new Reja(position = game.at(17, 11), imagen = "rejas/verde.png"))
		game.addVisual(new Reja(position = game.at(1, 9), imagen = "rejas/roja.png"))
	}

}

