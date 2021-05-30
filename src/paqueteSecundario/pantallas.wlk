import wollok.game.*
import paquetePrimario.imagen.*
import paquetePrimario.audio.*
import paquetePrimario.configuracion.*
import paquetePrimario.pantallaJuego.*
import paqueteSecundario.niveles.*
import paqueteSecundario.estados.*
import paqueteVisuales.presionarEnter.*

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
		pantallaPresionaEnterParaContinuar.presionaEnterParaContinuar()
		configuraciones.cambiarEstado(estadoInicio)
		game.schedule(1, { audio.reproducirCancionEnLoop("inicio")})
	}

}

object pantallaTutorial inherits Pantalla(imagen = "pantallas/tutorial.jpg") {

	override method iniciar() {
		super()
		pantallaPresionaEnterParaContinuar.borrarOnTick()
		pantallaPresionaEnterParaContinuar.presionaEnterParaContinuar()
		configuraciones.cambiarEstado(estadoTutorial)
		game.schedule(1, { audio.reproducirCancionEnLoop("tutorial")})
	}

}

object pantallaObjetos inherits Pantalla(imagen = "pantallas/objetos.jpg") {

	override method iniciar() {
		super()
		pantallaPresionaEnterParaContinuar.borrarOnTick()
		pantallaPresionaEnterParaContinuar.presionaEnterParaContinuar()
		configuraciones.cambiarEstado(estadoObjetos)
	}

}

object pantallaEnemigos inherits Pantalla(imagen = "pantallas/enemigos.jpg") {

	override method iniciar() {
		super()
		pantallaPresionaEnterParaContinuar.borrarOnTick()
		pantallaPresionaEnterParaContinuar.presionaEnterParaContinuar()
		configuraciones.cambiarEstado(estadoEnemigos)
	}

}

object pantallaCargando inherits Pantalla(imagen = "pantallas/cargando.jpg") {

	override method iniciar() {
		super()
		pantallaPresionaEnterParaContinuar.borrarOnTick()
		pantallaJuego.nivelActual(nivel1)
		configuraciones.cambiarEstado(estadoCargando)
		game.schedule(500, { pantallaJuego.iniciar()})
	}

}

object pantallaGameOver inherits Pantalla(imagen = "pantallas/gameover.jpg") {

	override method iniciar() {
		game.clear()
		super()
		game.schedule(1, { audio.reproducirCancionEnLoop("gameover")})
		configuraciones.configurarTeclas()
		configuraciones.cambiarEstado(estadoGameOver)
	}

}

object pantallaGanaste inherits Pantalla(imagen = "pantallas/ganaste.jpg") {

	override method iniciar() {
		game.clear()
		super()
		configuraciones.configurarTeclas()
		configuraciones.cambiarEstado(estadoGanaste)
	}

}
