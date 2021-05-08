import wollok.game.*
import paredes.*
import configuraciones.*
import bordes.*
import pisos.*

class Nivel {
	
	method cargarNivel(){

		configuraciones.configurarColisiones()	
		configuraciones.cambiarEstado(estadoJuego)
	}

}

object nivel1 inherits Nivel{
	
	override method cargarNivel() {
		//musicaJuego.play()
		pisos.agregarPisosNivel1()	
		paredes.agregarParedesNivel1()
		bordes.agregarBordesNivel1()

	}
}