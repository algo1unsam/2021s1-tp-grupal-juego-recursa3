import wollok.game.*
import objectos.*
import individuos.*
import paquetePrimario.imagen.*

class Cofre inherits Imagen{

	var property objetoGuardado = null

	override method interactuarConObjeto(){
		if(objetoGuardado != null){
			if(personaje.cantidadLlaves() > 0){
				personaje.utilizarObjeto(llave)
				game.addVisualIn(cofreAbierto, game.at(self.position().x(),self.position().y()))
				game.removeVisual(self)
			}else{
				game.say(personaje, "Necesitas una llave para abrir el cofre")
			}
		}
		return self.objetoGuardado()
	}
}

object cofres{
	method agregarCofresNivel1(){
		game.addVisual(cofreCerradoLevel1)
	}
}

object cofreCerradoLevel1 inherits Cofre(position = game.at(11,2), imagen="cofres/cofreCerrado.png", objetoGuardado = espadaChica){}
object cofreAbierto inherits Imagen(imagen="cofres/cofreAbierto.png"){}