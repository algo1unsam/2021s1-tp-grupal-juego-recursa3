import wollok.game.*
import paquetePrimario.configuracion.*
import paqueteSecundario.niveles.*
import paqueteSecundario.estados.*
import paquetePrimario.imagen.*
import paquetePrimario.pantallaJuego.*

class Pantalla inherits Imagen {

	method iniciar() {
		self.cerrar()
		game.addVisualIn(self, game.origin())
	}

	method cerrar() {
		game.allVisuals().forEach({ visual => game.removeVisual(visual)})
	}

}

object pantallaInicio inherits Pantalla(imagen = "pantallas/inicio.jpg") {

	override method iniciar() {
		super()
		configuraciones.cambiarEstado(estadoInicio)
	// game.schedule(1, {musicaInicio.play()})
	}

}

object pantallaTutorial inherits Pantalla(imagen = "pantallas/tutorial.jpg") {

	override method iniciar() {
		super()
		configuraciones.cambiarEstado(estadoTutorial)
	}

}

object pantallaObjetos inherits Pantalla(imagen = "pantallas/objetos.jpg") {

	override method iniciar() {
		super()
		configuraciones.cambiarEstado(estadoObjetos)
	}

}

object pantallaEnemigos inherits Pantalla(imagen = "pantallas/enemigos.jpg") {

	override method iniciar() {
		super()
		configuraciones.cambiarEstado(estadoEnemigos)
	}

}

object pantallaCargando inherits Pantalla(imagen = "pantallas/cargando.jpg") {

	override method iniciar() {
		super()
		configuraciones.cambiarEstado(estadoCargando)
		game.schedule(500, { pantallaJuego.iniciar()})
	}

}

object pantallaGameOver inherits Pantalla(imagen = "pantallas/gameover.jpg") {

	override method iniciar() {
		game.clear()
		super()
		pantallaJuego.nivelActual(nivel1)
		configuraciones.configurarTeclas()
		configuraciones.cambiarEstado(estadoGameOver)
	}

}

object pantallaGanaste inherits Pantalla(imagen = "pantallas/ganaste.jpg") {

	override method iniciar() {
		game.clear()
		super()
		pantallaJuego.nivelActual(nivel1)
		configuraciones.configurarTeclas()
		configuraciones.cambiarEstado(estadoGanaste)
	}

}

