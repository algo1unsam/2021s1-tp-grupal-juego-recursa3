import individuos.*
import direcciones.*
import objetos.*
import wollok.game.*

class Estado{
	method alPresionarUp(){}
	method alPresionarDown(){}
	method alPresionarRight(){}
	method alPresionarLeft(){}
	method alPresionarE(){}
	method alPresionarEnter(){}
	method alPresionar1(){}
	method alPresionar2(){}
	method alPresionar3(){}
}

object juego inherits Estado{
	override method alPresionarUp() {
		personaje.moverse(arriba)
	}
	override method alPresionarDown() {
		personaje.moverse(abajo)
	}
	override method alPresionarRight() {
		personaje.moverse(derecha)
	}
	override method alPresionarLeft() {
		personaje.moverse(izquierda)
	}
	override method alPresionarE() {
		personaje.interactuarConObjetos(game.getObjectsIn(game.at(personaje.position().x(), personaje.position().y())))
	}
	override method alPresionarEnter(){
		personaje.atacar()
	}
}

object menu inherits Estado{
	override method alPresionarEnter() {
		//comenzar juego
	}
}