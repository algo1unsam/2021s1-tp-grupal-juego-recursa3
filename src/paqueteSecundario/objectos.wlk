import paquetePrimario.imagen.*
import wollok.game.*

class Objeto inherits Imagen{

	var property categoria
	var property peso

}

object objetos{
	method agregarObjetosNivel1(){
		game.addVisualIn(llave, game.at(5,5))
		//game.addVisualIn(mochilaChica, game.at(3,1))
	}
}

class Escudo inherits Objeto{

	var property defensa

}

object escudoChico inherits Escudo(categoria="escudo", peso = 5, defensa=10, imagen="objetos/escudoChico.png"){}
object escudoGrande inherits Escudo(categoria="escudo", peso = 10, defensa=20, imagen="objetos/escudoGrande.png"){}

class Espada inherits Objeto{

	var property danio

}

object espadaChica inherits Espada(categoria="espada", peso = 5, danio=10, imagen="objetos/espadaChica.png"){}
object espadaGrande inherits Espada(categoria="espada", peso = 10, danio=20, imagen="objetos/espadaGrande.png"){}

class Mochila inherits Objeto{

	const objetosGuardados = []

	method controlarPeso() {
		return objetosGuardados.sum{ unObjeto => unObjeto.peso() } - peso < 0
	}

	method agregarObjeto(unObjeto) {
		if (self.controlarPeso()){
			// No puede tener mas de 2 espadas
			if(objetosGuardados.map({ unObjetoGuardado => unObjetoGuardado.categoria() == "espada" }).size() <= 2 ){
				objetosGuardados.add(unObjeto)
				//Agrega la visual del objeto a la zona donde se muestran los objetos que tenes a la derecha de todo
				game.addVisualIn(unObjeto, game.at(23,5))
			}else{
				game.addVisual("No puedes tener mas de 2 espadas, desecha una primero")
			}
			
			// No puede tener mas de 1 escudo.
			if(objetosGuardados.map({ unObjetoGuardado => unObjetoGuardado.categoria() == "escudo" }).size() <= 1 ){
				objetosGuardados.add(unObjeto)
			}else{
				game.addVisual("No puedes tener mas de 1 escudo, desecha el actual primero")
			}
			
			// Al encontrar una mochila la cambia por la que ya tiene
			if(unObjeto.categoria() == "mochila"){
				peso = unObjeto.peso()
				imagen = unObjeto.imagen()
			}
		}else{
			// Podemos agregar un visual ej: cartel, mensaje o imagen, en la parte libre de la derecha
			// que diga por ejemplo esto:
			game.addVisual("No tenes espacio para llevar este objeto, desecha uno primero para ganar mas espacio")
		}
	}

	method desecharObjeto(unObjeto) {
		objetosGuardados.remove(unObjeto)
	}
}
	
object mochilaChica inherits Mochila(categoria="mochila", peso = 15, imagen="objetos/mochilaChica.png"){}
object mochilaGrande inherits Mochila(categoria="mochila", peso = 20, imagen="objetos/mochilaGrande.png"){}

object llave inherits Objeto (categoria="llave", peso = 0, imagen="llave/llave.png"){}