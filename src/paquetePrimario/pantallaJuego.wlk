import wollok.game.*
import paqueteSecundario.niveles.*
import paqueteSecundario.pantallas.*

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
		pantallaGanaste.iniciar()
	}
}
