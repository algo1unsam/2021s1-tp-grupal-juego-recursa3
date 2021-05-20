import wollok.game.*
import direcciones.*
import paquetePrimario.imagen.*

class Individuo inherits Imagen{
	var property orientacion = derecha
	var property vida = 100
	var property armadura = null
	var property mano1 = null
	var property mano2 = null
	
	method moverse(direccion) {
		self.moverHaciaSiSePuede(self, direccion)
	}
	
	method moverHaciaSiSePuede(personaje, direccion) {
		if(direccion.puedeIr(personaje)){
			self.moverHacia(personaje, direccion)
		}
	}
	
	method moverHacia(personaje, direccion) {
		const nuevaPosicion = direccion.posicion(personaje.position())
		if(self.puedeMoverse(nuevaPosicion)){
			personaje.orientacion(direccion)
			personaje.position(nuevaPosicion)
		}
		
	}
	
	method puedeMoverse(posicion) = posicion.allElements().all({objeto => objeto.esAtravesable()})

	method atacar(){}
}

object personaje inherits Individuo (position = game.at(1,1), imagen = "individuo/personaje.png") {
	var property energia = 100
	var property mochila = null

	method equiparObjeto(){
		
	}

	method utilizarObjeto(){
		
	}

	method agregarObjeto(unObjeto){
		if (mochila != null){
			mochila.agregarObjeto(unObjeto)
		}
	}
	
	method desecharObjeto(unObjeto){ 
		if (mochila != null){
			mochila.desecharObjeto(unObjeto)
		}
	}
	
	method image() {
		//if(self.tieneAlgoEnMano1()){
			//return "individuo/personaje + orientacion.nombre() + mano1.getObjeto() + ".png"
		//}
		//if(selftieneAlgoEnMano2()){
			//return "individuo/personaje + orientacion.nombre() + mano2.getObjeto() + ".png"
		//}
		//if(self.tieneAlgoEnAmbasManos()){
			//return "individuo/personaje + orientacion.nombre() + mano1.getObjeto() + mano2.getObjeto() + ".png"
		//}
		return "individuo/personaje" + orientacion.nombre() + ".png"
	}
}

object enemigo inherits Individuo (position = game.at(10,10), imagen = "individuo/enemigo.png") {
	var property visible = false
}