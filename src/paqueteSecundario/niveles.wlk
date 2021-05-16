import wollok.game.*
import paredes.*
import bordes.*
import pisos.*
import estados.*
import paquetePrimario.configuracion.*

class Nivel {
	
	method cargarNivel(){

		configuraciones.configurarColisiones()	
		configuraciones.cambiarEstado(juego)
	}

}

object nivel1 inherits Nivel{
	
	override method cargarNivel() {
		//musicaJuego.play()
		pisos.agregarPisosNivel1()
		bordes.agregarBordesNivel1()
		paredes.agregarParedesNivel1()

	}
}