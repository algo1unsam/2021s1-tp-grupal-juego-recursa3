import individuos.*
import direcciones.*
import objetos.*
import wollok.game.*
import paqueteSecundario.pantallas.*
import paqueteSecundario.niveles.*
import paqueteVisuales.presionarEnter.*
import paquetePrimario.audio.*

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
		game.schedule(1, { audio.reproducirSonido("presionarEnter")})
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
		personaje.interactuarConObjetos()
	}

	override method alPresionarSpace() {
		personaje.atacar()
	}

}

object estadoInicio inherits Estado {

	override method alPresionarEnter() {
		super()
		pantallaTutorial.iniciar()
	}

}

object estadoTutorial inherits Estado {

	override method alPresionarEnter() {
		super()
		pantallaObjetos.iniciar()
	}

}

object estadoObjetos inherits Estado {

	override method alPresionarEnter() {
		super()
		pantallaEnemigos.iniciar()
	}

}

object estadoEnemigos inherits Estado {

	override method alPresionarEnter() {
		super()
		pantallaCargando.iniciar()
	}

}

object estadoCargando inherits Estado {

}

object estadoGameOver inherits Estado {

	override method alPresionarEnter() {
		super()
		visualPresionaEnterParaVolver.cerrar()
		pantallaInicio.iniciar()
	}

}

object estadoGanaste inherits Estado {

	override method alPresionarEnter() {
		super()
		visualPresionaEnterParaVolver.cerrar()
		pantallaInicio.iniciar()
	}

}

