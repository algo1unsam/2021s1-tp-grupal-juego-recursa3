import wollok.game.*
import paquetePrimario.configuracion.*
import paqueteSecundario.niveles.*
import paqueteSecundario.estados.*

class Pantalla {

	var property imagen = "general/vacio.png"

	method image() = imagen

	method iniciar() {
		game.addVisualIn(self, game.origin())
	}

	method cerrar() {
		game.allVisuals().forEach({ visual => game.removeVisual(visual)})
	}

}

object pantallaInicio inherits Pantalla(imagen = "pantallas/inicio.jpg") {

	override method iniciar() {
		super()
		configuraciones.cambiarEstado(inicio)
		// game.schedule(1, {musicaInicio.play()})
	}

}

object pantallaTutorial inherits Pantalla(imagen = "pantallas/tutorial.jpg") {

	override method iniciar() {
		self.cerrar()
		super()
		configuraciones.cambiarEstado(tutorial)
	}

}

object pantallaEnemigosObjetos inherits Pantalla(imagen = "pantallas/enemigosObjetos.jpg") {

	override method iniciar() {
		self.cerrar()
		super()
		configuraciones.cambiarEstado(enemigosObjetos)
	}

}

