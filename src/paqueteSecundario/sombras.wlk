import paquetePrimario.imagen.*
import wollok.game.*

class Sombra inherits Imagen {

}

object sombras inherits Sombra {

	method agregarSombra1Nivel1() {
		game.addVisual(sombra1Nivel1)
	}

	method agregarSombra2Nivel1() {
		game.addVisual(sombra2Nivel1)
		game.removeVisual(sombra1Nivel1)
	}

	method agregarSombra3Nivel1() {
		game.addVisual(sombra3Nivel1)
		game.removeVisual(sombra2Nivel1)
	}
	
	method removerSombra3Nivel1(){
		game.removeVisual(sombra3Nivel1)
	}

	method agregarSombra1Nivel2() {
		game.addVisual(sombra1Nivel2)
	}

	method agregarSombra2Nivel2() {
		game.addVisual(sombra2Nivel2)
		game.removeVisual(sombra1Nivel2)
	}

	method agregarSombra3Nivel2() {
		game.addVisual(sombra3Nivel2)
		game.removeVisual(sombra2Nivel2)
	}
	
	method removerSombra3Nivel2(){
		game.removeVisual(sombra3Nivel2)
	}

	method agregarSombra1Nivel3() {
		game.addVisual(sombra1Nivel3)
	}

	method agregarSombra2Nivel3() {
		game.addVisual(sombra2Nivel3)
		game.removeVisual(sombra1Nivel3)
	}

	method agregarSombra3Nivel3() {
		game.addVisual(sombra3Nivel3)
		game.removeVisual(sombra2Nivel3)
	}
	
	method agregarSombra4Nivel3() {
		game.addVisual(sombra4Nivel3)
		game.removeVisual(sombra3Nivel3)
	}
	
	method removerSombra4Nivel3(){
		game.removeVisual(sombra4Nivel3)
	}

}

object sombra1Nivel1 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra1Nivel1.png") {

}

object sombra2Nivel1 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra2Nivel1.png") {

}

object sombra3Nivel1 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra3Nivel1.png") {

}

object sombra1Nivel2 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra1Nivel2.png") {

}

object sombra2Nivel2 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra2Nivel2.png") {

}

object sombra3Nivel2 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra3Nivel2.png") {

}

object sombra1Nivel3 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra1Nivel3.png") {

}

object sombra2Nivel3 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra2Nivel3.png") {

}

object sombra3Nivel3 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra3Nivel3.png") {

}

object sombra4Nivel3 inherits Sombra(position = game.at(1, 1), imagen = "sombras/sombra4Nivel3.png") {

}


