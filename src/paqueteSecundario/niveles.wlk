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
		pantallaJuego.cerrar()
	}

	method reiniciarPersonaje()

}

object nivel1 inherits Nivel {

	override method cargarNivel() {
		super()
		self.reiniciarPersonaje()
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
		enemigosNivel1.reiniciarPosicion()
		enemigosNivel1.agregarEnemigosZonaInicio()
		sombras.agregarSombra1Nivel1()
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.avanzarNivel(nivel2)
	}

	override method reiniciarPersonaje() {
		personaje.position(game.at(1, 1))
		personaje.vida(6)
		personaje.mochila(null)
		personaje.mano1(null)
		personaje.mano2(null)
		mochilaChica.objetosGuardados().clear()
	}

}

object nivel2 inherits Nivel {

	override method cargarNivel() {
		self.reiniciarPersonaje()
		game.schedule(1, { audio.reproducirCancionEnLoop("nivel2")})
		pisos.agregarPisosNivel2()
		bordes.agregarBordesNivel2()
		paredes.agregarParedesNivel2()
		rejas.agregarRejasNivel2()
		salidas.agregarSalidasNivel2()
		cofres.agregarCofresNivel2()
		menu.agregarMenu()
		game.addVisual(personaje)
		personaje.mostrarVida()
		enemigosNivel2.reiniciarPosicion()
		enemigosNivel2.agregarEnemigosZonaInicio()
		sombras.agregarSombra1Nivel2()
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.avanzarNivel(nivel3)
	}

	override method reiniciarPersonaje() {
		personaje.position(game.at(19, 1))
	}

}

object nivel3 inherits Nivel {

	override method cargarNivel() {
		self.reiniciarPersonaje()
		pisos.agregarPisosNivel3()
		bordes.agregarBordesNivel3()
		paredes.agregarParedesNivel3()
		rejas.agregarRejasNivel3()
		salidas.agregarSalidasNivel3()
		cofres.agregarCofresNivel3()
		menu.agregarMenu()
		game.addVisual(personaje)
		personaje.mostrarVida()
		enemigosNivel3.reiniciarPosicion()
		enemigosNivel3.agregarEnemigosZonaInicio()
		sombras.agregarSombra1Nivel3()
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel() {
		super()
		pantallaJuego.terminarJuego()
	}

	override method reiniciarPersonaje() {
		personaje.position(game.at(11, 1))
	}
	
	method batallaFinal(){
		sombras.removerSombra4Nivel3()
		personaje.position(game.at(11, 9))
		enemigosNivel3.agregarEnemigosZonaRoja()
	}

}

