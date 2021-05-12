import wollok.game.*
import objecto.*
//object

class Cofre {
	
	var property position = game.at(0,0)
	var property imagen = "general/vacio.png"
	var property objetoGuardado = null
	method esAtravesable() = false
	
	method image() = imagen 
	
	method abrirCofre(unaLlave){
	
	}
	
}

object cofreLevel1 inherits Cofre(position = game.at(2,0),imagen="objetos/cofre.png",objetoGuardado = espadaChica){
	
	
	

}