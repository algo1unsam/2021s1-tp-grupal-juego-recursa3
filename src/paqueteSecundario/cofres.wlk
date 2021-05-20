import wollok.game.*
import objectos.*
import paquetePrimario.imagen.*

class Cofre inherits Imagen{

	var property objetoGuardado = null

	method abrirCofre(unaLlave){
		
		//mochila.agregarObjeto(objetoGuardado) así pero llamando a mochila
		game.addVisualIn("cofre/cofreAbierto.png", self.position())
		//Va esto? Quiero al objeto en el mismo lugar: game.addVisualIn("objetos/"+ objetoGuardado + ".png", self.position())

	}

}

object cofreLevel1 inherits Cofre(position = game.at(2,0),imagen="cofre/cofreCerrado.png",objetoGuardado = espadaChica){

}