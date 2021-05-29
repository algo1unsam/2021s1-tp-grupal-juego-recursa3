import wollok.game.*

object audio {

	var property cancionActual = null

	method cancion(cancionName) = game.sound("canciones/" + cancionName + ".wav")
	method sonido(sonidoName) = game.sound("sonidos/" + sonidoName + ".wav")

	method reproducirCancion(nombreCancion) {
		cancionActual = self.cancion(nombreCancion)
		cancionActual.play()
	}

	method reproducirCancionEnLoop(nombreCancion) {
		self.parar()
		self.reproducirCancion(nombreCancion)
		cancionActual.shouldLoop(true)
	}
	
	method reproducirSonido(nombreSonido){
		self.sonido(nombreSonido).play()
	}

	method parar() {
		if (cancionActual != null) {
			cancionActual.stop()
		}
		cancionActual = null
	}

}

