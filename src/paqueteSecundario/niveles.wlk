import wollok.game.*
import paredes.*
import bordes.*
import pisos.*
import estados.*
import salidas.*
import paquetePrimario.configuracion.*
import paquetePrimario.pantallaJuego.*
import paqueteSecundario.individuos.*

class Nivel {

	method cargarNivel(){

		configuraciones.cambiarEstado(juego)
	}

	method finalizarNivel()

	method reiniciarElementos() {
		//personaje.moverAlInicio()
		//personaje.aumentarEnergia(100)
	}
}

object nivel1 inherits Nivel{

	override method cargarNivel() {
		//musicaJuego.play()
		pisos.agregarPisosNivel1()
		bordes.agregarBordesNivel1()
		paredes.agregarParedesNivel1()
		salidas.agregarSalidasNivel1()
		game.addVisual(personaje)
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel(){
		game.allVisuals().forEach({visual => game.removeVisual(visual)})
		self.reiniciarElementos()
		pantallaJuego.avanzarNivel(nivel2)
	}
}

object nivel2 inherits Nivel{

	override method cargarNivel() {
		//musicaJuego.play()
		//pisos.agregarPisosNivel2()
		//bordes.agregarBordesNivel2()
		//paredes.agregarParedesNivel2()
		//salidas.agregarSalidasNivel2()
		game.addVisual(personaje)
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel(){
		game.allVisuals().forEach({visual => game.removeVisual(visual)})
		self.reiniciarElementos()
		pantallaJuego.avanzarNivel(nivel3)
	}
}

object nivel3 inherits Nivel{

	override method cargarNivel() {
		//musicaJuego.play()
		//pisos.agregarPisosNivel3()
		//bordes.agregarBordesNivel3()
		//paredes.agregarParedesNivel3()
		//salidas.agregarSalidasNivel3()
		game.addVisual(personaje)
		configuraciones.configurarColisiones()
	}

	override method finalizarNivel(){
		game.allVisuals().forEach({visual => game.removeVisual(visual)})
		pantallaJuego.terminarJuego()
	}
}