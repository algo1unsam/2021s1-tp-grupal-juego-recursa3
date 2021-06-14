import wollok.game.*
import paquetePrimario.imagen.*
import paquetePrimario.audio.*
import paquetePrimario.configuracion.*
import paqueteSecundario.niveles.*
import paqueteSecundario.estados.*
import paqueteVisuales.presionarEnter.*
import paqueteSecundario.individuos.*

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
		visualPresionaEnterParaContinuar.iniciar()
		configuraciones.cambiarEstado(estadoInicio)
		game.schedule(1, { audio.reproducirCancionEnLoop("inicio")})
	}

}

object pantallaTutorial inherits Pantalla(imagen = "pantallas/tutorial.jpg") {

	override method iniciar() {
		super()
		visualPresionaEnterParaContinuar.cerrar()
		visualPresionaEnterParaContinuar.iniciar()
		configuraciones.cambiarEstado(estadoTutorial)
		game.schedule(1, { audio.reproducirCancionEnLoop("tutorial")})
	}

}

object pantallaObjetos inherits Pantalla(imagen = "pantallas/objetos.jpg") {

	override method iniciar() {
		super()
		visualPresionaEnterParaContinuar.cerrar()
		visualPresionaEnterParaContinuar.iniciar()
		configuraciones.cambiarEstado(estadoObjetos)
	}

}

object pantallaEnemigos inherits Pantalla(imagen = "pantallas/enemigos.jpg") {

	override method iniciar() {
		super()
		visualPresionaEnterParaContinuar.cerrar()
		visualPresionaEnterParaContinuar.iniciar()
		configuraciones.cambiarEstado(estadoEnemigos)
	}

}

object pantallaNivel1 inherits Pantalla(imagen = "pantallas/nivel1.jpg") {

	override method iniciar() {
		super()
		visualPresionaEnterParaContinuar.cerrar()
		pantallaJuego.nivelActual(nivel1)
		configuraciones.cambiarEstado(estadoNivel)
		game.schedule(500, { pantallaJuego.iniciar()})
	}

}

object pantallaNivel2 inherits Pantalla(imagen = "pantallas/nivel2.jpg") {

}

object pantallaNivel3 inherits Pantalla(imagen = "pantallas/nivel3.jpg") {

}

object pantallaGameOver inherits Pantalla(imagen = "pantallas/gameover.jpg") {

	override method iniciar() {
		game.clear()
		super()
		visualPresionaEnterParaVolver.iniciar()
		game.schedule(1, { audio.reproducirCancionEnLoop("gameover")})
		configuraciones.configurarTeclas()
		configuraciones.cambiarEstado(estadoGameOver)
	}

}

object pantallaGanaste inherits Pantalla(imagen = "pantallas/ganaste.jpg") {

	override method iniciar() {
		game.clear()
		super()
		game.schedule(1, { audio.reproducirCancionEnLoop("ganaste")})
		visualPresionaEnterParaVolver.iniciar()
		configuraciones.configurarTeclas()
		configuraciones.cambiarEstado(estadoGanaste)
	}

}

object pantallaJuego inherits Pantalla {

	var property nivelActual = nivel1

	override method iniciar() {
		nivelActual.cargarNivel()
	}

	method avanzarNivel(unNivel) {
		nivelActual = unNivel
		self.iniciar()
	}

	method terminarJuego() {
		pantallaGanaste.iniciar()
	}

	method peleaFinal() {
		audio.parar()
		game.onCollideDo(personaje, {})
		game.schedule(5, { audio.reproducirSonido("pensasteQueEraTanFacil")})
		game.addVisualIn(pantallaPensasteQueEraTanFacil, game.origin())
		game.schedule(2500, { nivel3.batallaFinal()
			game.removeVisual(pantallaPensasteQueEraTanFacil)
			configuraciones.configurarColisiones()
		})
	}

	method pantallaNivel() {
		if (nivelActual == nivel1) {
			return pantallaNivel2
		} else {
			return pantallaNivel3
		}
	}

}

object pantallaPensasteQueEraTanFacil inherits Pantalla(imagen = "pantallas/cargando.jpg") {
	override method teEncontro(){
		
	}
}

