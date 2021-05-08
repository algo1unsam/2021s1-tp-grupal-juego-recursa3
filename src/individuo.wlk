import wollok.game.*
import direcciones.*

class Individuo {
	var property position =  game.center()
	var property orientacion = derecha
	var property vida = 100
	var property armadura = null
	var property mano1 = null
	var property mano2 = null
	var property esAtravesable = true

	method image() {
		return "personajes/personaje.png"
	}
	
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

object personaje inherits Individuo (position = game.at(1,1)) {
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
}

object enemigo inherits Individuo (position = game.at(10,10)) {
	var visible = false
}
