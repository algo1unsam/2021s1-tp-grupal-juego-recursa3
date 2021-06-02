import wollok.game.*
import estados.*
import individuos.*
import objetos.*
import pantallas.*
import paquetePrimario.menu.*
import paquetePrimario.audio.*
import paquetePrimario.configuracion.*
import paqueteBloques.paredes.*
import paqueteBloques.bordes.*
import paqueteBloques.pisos.*
import paqueteBloques.salidas.*
import paqueteBloques.rejas.*
import paqueteBloques.sombras.*

class Nivel {

	method cargarNivel() {
		configuraciones.cambiarEstado(juego)
	}

	method finalizarNivel() {
		self.cerrarPantallas()
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
		rejas.agregarRejasNivel1()
		salidas.agregarSalidasNivel1()
		objetos.agregarObjetosNivel1()
		cofres.agregarCofresNivel1()
		menu.agregarMenu()
		game.addVisual(personaje)
		personaje.mostrarVida()
		enemigos.agregarEnemigosNivel1ZonaInicio()
		sombras.agregarSombra1Nivel1()
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
		rejas.agregarRejasNivel2()
		salidas.agregarSalidasNivel2()
		cofres.agregarCofresNivel2()
		enemigos.agregarEnemigosNivel2ZonaInicio()
		menu.agregarMenu()
		game.addVisual(personaje)
		self.reiniciarElementos()
		sombras.agregarSombra1Nivel2()
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		self.cerrarPantallas()
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
		rejas.agregarRejasNivel3()
		salidas.agregarSalidasNivel3()
			// cofres.agregarCofresNivel3()
			// enemigo.agregarEnemigoNivel3()
		menu.agregarMenu()
		personaje.position(game.at(11, 1))
		game.addVisual(personaje)
		sombras.agregarSombra1Nivel3()
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.terminarJuego()
	}

}

