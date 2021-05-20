import individuos.*
import direcciones.*
import objectos.*
import cofres.*

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
		//Aca algo me falta, debería poder llamar al cofre del nivel que sea
		cofreLevel1.abrirCofre(llave)
	}
}

object menu inherits Estado{
	override method alPresionarEnter() {
		//comenzar juego
	}
}

