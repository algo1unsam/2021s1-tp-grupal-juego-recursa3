import wollok.game.*
import paqueteSecundario.niveles.*
import paqueteSecundario.pantallas.*

object pantallaJuego {

	var property nivelActual = nivel1
	
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
