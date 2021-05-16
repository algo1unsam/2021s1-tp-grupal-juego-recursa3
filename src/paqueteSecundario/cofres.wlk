import wollok.game.*
import objectos.*
import paquetePrimario.imagen.*

class Cofre inherits Imagen{

	var property objetoGuardado = null

	method abrirCofre(unaLlave){

	}

}

object cofreLevel1 inherits Cofre(position = game.at(2,0),imagen="objetos/cofre.png",objetoGuardado = espadaChica){

}