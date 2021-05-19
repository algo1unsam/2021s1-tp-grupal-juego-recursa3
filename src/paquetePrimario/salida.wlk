import wollok.game.*
import imagen.*
import pantallaJuego.*

class Salida inherits Imagen{

	override method teEncontro(){
		pantallaJuego.nivelActual().finalizarNivel()
	}
}

object salidas {
	method agregarSalidasNivel1() {
		// Elimina todo objeto que este en el lugar donde voy a poner la salida.
		game.getObjectsIn(game.at(19,13)).forEach({visual => game.removeVisual(visual)})
		
		// Agrego la salida
		game.addVisual(new Salida(position = game.at(19,13),  imagen = "puerta/puerta.png"))
	}
	

}