import individuos.*
import direcciones.*
import objetos.*
import wollok.game.*
import paqueteSecundario.pantallas.*
import paqueteSecundario.niveles.*
import paqueteVisuales.presionarEnter.*

class Estado {

	method alPresionarUp() {
	}

	method alPresionarDown() {
	}

	method alPresionarRight() {
	}

	method alPresionarLeft() {
	}

	method alPresionarE() {
	}

	method alPresionarEnter() {
	}

	method alPresionar1() {
	}

	method alPresionar2() {
	}

	method alPresionar3() {
	}

	method alPresionarSpace() {
	}

}

object juego inherits Estado {

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

	override method alPresionarSpace() {
		personaje.atacar()
	}

}

object estadoInicio inherits Estado {

	override method alPresionarEnter() {
		pantallaTutorial.iniciar()
	}

}

object estadoTutorial inherits Estado {

	override method alPresionarEnter() {
		pantallaObjetos.iniciar()
	}

}

object estadoObjetos inherits Estado {

	override method alPresionarEnter() {
		pantallaEnemigos.iniciar()
	}

}

object estadoEnemigos inherits Estado {

	override method alPresionarEnter() {
		pantallaCargando.iniciar()
	}

}

object estadoCargando inherits Estado {

}

object estadoGameOver inherits Estado {

	override method alPresionarEnter() {
		pantallaGameOver.cerrar()
		pantallaInicio.vuelveAEmpezar(true)
		pantallaInicio.iniciar()
	}

}

object estadoGanaste inherits Estado {

	override method alPresionarEnter() {
		pantallaGanaste.cerrar()
		pantallaInicio.vuelveAEmpezar(true)
		pantallaInicio.iniciar()
	}

}

