import wollok.game.*

class Imagen {

	var property position = game.at(0,0)
	var property imagen = "general/vacio.png"

	method esAtravesable() = true

	method image() = imagen
	
	method teEncontro(){
		// Agregar logica al metodo dependiendo objeto
	}
}
