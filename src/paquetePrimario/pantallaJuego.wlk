import paqueteSecundario.niveles.*
import wollok.game.*

object pantallaJuego {

	var nivelActual = nivel1

	method nivelActual() = nivelActual
	
	method iniciar() {
		nivelActual.cargarNivel()
	}

	method avanzarNivel(unNivel) {
		nivelActual = unNivel
		self.iniciar()
	}

	method terminarJuego(){
		//musicaJuego.stop()
		//sonido.reproducir("musicaEpica")
		//game.addVisual(fondoGanaste)
		game.clear()
		game.schedule(10000, { /*volver inicio juego */})
	}
}
