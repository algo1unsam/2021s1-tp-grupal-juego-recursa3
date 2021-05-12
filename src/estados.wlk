import individuos.*
import direcciones.*

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

object estadoJuego inherits Estado{
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
	}
}
