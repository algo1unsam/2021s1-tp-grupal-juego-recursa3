import wollok.game.*
import paredes.*
import configuraciones.*

class Nivel {
	
	method cargarNivel(){

		configuraciones.configurarColisiones()	
		configuraciones.cambiarEstado(estadoJuego)
	}

}


object nivel1 inherits Nivel{
	
	override method cargarNivel() {
		//musicaJuego.play()
		
		paredHorizontal.agregarParedesHorizontales()
		paredVertical.agregarParedesVerticales()
		}

	}