import wollok.game.*
import paredes.*
import configuraciones.*
import bordes.*

class Nivel {
	
	method cargarNivel(){

		configuraciones.configurarColisiones()	
		configuraciones.cambiarEstado(estadoJuego)
	}

}

object nivel1 inherits Nivel{
	
	override method cargarNivel() {
		//musicaJuego.play()
		
		paredes.agregarParedesNivel1()
		bordes.agregarBordesNivel1()
		}

	}