import wollok.game.*
import paredes.*
import bordes.*
import pisos.*
import estados.*
import salidas.*
import pantallas.*
import paquetePrimario.menu.*
import paquetePrimario.audio.*
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
		personaje.mochila(null)
		personaje.mano1(null)
		personaje.mano2(null)
		mochilaChica.objetosGuardados().clear()
	}

	method cerrarPantallas() {
		game.allVisuals().forEach({ visual => game.removeVisual(visual)})
	}

}

object nivel1 inherits Nivel {

	override method cargarNivel() {
		super()
		self.cerrarPantallas()
		self.reiniciarElementos()
		game.schedule(1, { audio.reproducirCancionEnLoop("nivel1")})
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
		game.schedule(1, { audio.reproducirCancionEnLoop("nivel2")})
		pisos.agregarPisosNivel2()
		bordes.agregarBordesNivel2()
		paredes.agregarParedesNivel2()
		salidas.agregarSalidasNivel2()
			// cofres.agregarCofresNivel3()
			// enemigo.agregarEnemigoNivel3()
		menu.agregarMenu()
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
		pisos.agregarPisosNivel3()
		bordes.agregarBordesNivel3()
		paredes.agregarParedesNivel3()
			// salidas.agregarSalidasNivel3()
			// cofres.agregarCofresNivel3()
			// enemigo.agregarEnemigoNivel3()
		menu.agregarMenu()
		game.addVisual(personaje)
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.terminarJuego()
	}

}

