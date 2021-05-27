import wollok.game.*
import paredes.*
import bordes.*
import pisos.*
import estados.*
import salidas.*
import paquetePrimario.menu.*
import paquetePrimario.configuracion.*
import paquetePrimario.pantallaJuego.*
import paqueteSecundario.individuos.*
import paqueteSecundario.objetos.*

class Nivel {

	method cargarNivel() {
		configuraciones.cambiarEstado(juego)
	}

	method finalizarNivel() {
		self.cerrarPantallas()
		self.reiniciarElementos()
	}

	method reiniciarElementos() {
		personaje.vida(6)
		personaje.position(game.at(1, 1))
	}

	method cerrarPantallas() {
		game.allVisuals().forEach({ visual => game.removeVisual(visual)})
	}

}

object nivel1 inherits Nivel {

	override method cargarNivel() {
		super()
			// musicaJuego.play()
		self.cerrarPantallas()
		self.reiniciarElementos()
		pisos.agregarPisosNivel1()
		bordes.agregarBordesNivel1()
		paredes.agregarParedesNivel1()
		salidas.agregarSalidasNivel1()
		objetos.agregarObjetosNivel1()
		cofres.agregarCofresNivel1()
		menu.agregarMenu()
		game.addVisual(personaje)
		personaje.mostrarVida()
		enemigo.agregarEnemigoNivel1()
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.avanzarNivel(nivel2)
	}

}

object nivel2 inherits Nivel {

	override method cargarNivel() {
		// musicaJuego.play()
		pisos.agregarPisosNivel2()
		bordes.agregarBordesNivel2()
		paredes.agregarParedesNivel2()
		salidas.agregarSalidasNivel2()
			// cofres.agregarCofresNivel3()
			// enemigo.agregarEnemigoNivel3()
		game.addVisual(personaje)
		self.reiniciarElementos()
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.avanzarNivel(nivel3)
	}

	override method reiniciarElementos() {
		personaje.position(game.at(19, 1))
	}

}

object nivel3 inherits Nivel {

	override method cargarNivel() {
		// musicaJuego.play()
		// pisos.agregarPisosNivel3()
		// bordes.agregarBordesNivel3()
		// paredes.agregarParedesNivel3()
		salidas.agregarSalidasNivel3()
		// cofres.agregarCofresNivel3()
		// enemigo.agregarEnemigoNivel3()
		game.addVisual(personaje)
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.terminarJuego()
	}

}

