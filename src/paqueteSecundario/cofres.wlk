import wollok.game.*
import objectos.*
import paquetePrimario.imagen.*

class Cofre inherits Imagen{

	var property objetoGuardado = null

	override method interactuarConObjeto(){
		if(objetoGuardado != null){
			game.addVisualIn(cofreAbierto, game.at(self.position().x(),self.position().y()))
		}
		return self.objetoGuardado()
	}
}

object cofres{
	method agregarCofresNivel1(){
		game.addVisual(cofreCerradoLevel1)
	}
}

object cofreCerradoLevel1 inherits Cofre(position = game.at(11,2), imagen="cofre/cofreCerrado.png", objetoGuardado = espadaChica){}
object cofreAbierto inherits Cofre(imagen="cofre/cofreAbierto.png", objetoGuardado = null){}

