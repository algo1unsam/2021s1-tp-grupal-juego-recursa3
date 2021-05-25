import wollok.game.*
import paquetePrimario.configuracion.*
import paqueteSecundario.niveles.*
import paqueteSecundario.estados.*
import paquetePrimario.imagen.*

class Pantalla inherits Imagen{

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
		configuraciones.cambiarEstado(estadoInicio)
	// game.schedule(1, {musicaInicio.play()})
	}

}

object pantallaTutorial inherits Pantalla(imagen = "pantallas/tutorial.jpg") {

	override method iniciar() {
		self.cerrar()
		super()
		configuraciones.cambiarEstado(estadoTutorial)
	}

}

object pantallaObjetos inherits Pantalla(imagen = "pantallas/objetos.jpg") {

	override method iniciar() {
		self.cerrar()
		super()
		configuraciones.cambiarEstado(estadoObjetos)
	}

}

object pantallaEnemigos inherits Pantalla(imagen = "pantallas/enemigos.jpg") {

	override method iniciar() {
		self.cerrar()
		super()
		configuraciones.cambiarEstado(estadoEnemigos)
	}

}

object pantallaCargando inherits Pantalla(imagen = "pantallas/cargando.jpg") {

	override method iniciar() {
		self.cerrar()
		super()
		configuraciones.cambiarEstado(estadoCargando)
		game.schedule(500, {nivel1.cargarNivel()})
	}

}

