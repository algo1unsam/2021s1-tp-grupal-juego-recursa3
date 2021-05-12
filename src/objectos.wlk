import imagen.*

class Objeto inherits Imagen{

	var property categoria
	var property peso

}

class Escudo inherits Objeto{

	var defensa

}

object escudoChico inherits Escudo(categoria="escudo", peso = 5, defensa=10, imagen="objeto/escudoChico.png"){}
object escudoGrande inherits Escudo(categoria="escudo", peso = 10, defensa=20, imagen="objeto/escudoGrande.png"){}

class Espada inherits Objeto{

	var danio

}

object espadaChica inherits Espada(categoria="espada", peso = 5, danio=10, imagen="objeto/espadaChica.png"){}
object espadaGrande inherits Espada(categoria="espada", peso = 10, danio=20, imagen="objeto/espadaGrande.png"){}

class Mochila inherits Objeto{

	const objetosGuardados = []

	method controlarPeso() {
		return objetosGuardados.sum{ unObjeto => unObjeto.peso() } - peso < 0
	}

	method agregarObjeto(unObjeto) {
		if (self.controlarPeso()){
			if(objetosGuardados.map({ unObjetoGuardado => unObjetoGuardado.categoria() == "espada" }).size() <= 2 ){
				objetosGuardados.add(unObjeto)
			}else{
				//game.addVisual("No puedes tener mas de 2 espadas, tira una de las tuyas (?")
			}
			
			// No puede tener mas de 1 escudo.
			if(objetosGuardados.map({ unObjetoGuardado => unObjetoGuardado.categoria() == "escudo" }).size() <= 1 ){
				objetosGuardados.add(unObjeto)
			}else{
				//game.addVisual("No puedes tener mas de 1 escudo, tira el tuyo (?")
			}
			
			// Al encontrar una mochila la cambia por la que ya tiene
			if(unObjeto.categoria() == "mochila"){
				peso = unObjeto.peso()
				imagen = unObjeto.imagen()
			}
		}else{
			// Podemos agregar un visual ej: cartel, mensaje o imagen, en la parte libre de la derecha
			// que diga por ejemplo esto:
			// game.addVisual("No tenes espacio para llevar este objeto tira un objeto para ganar mas espacio")
		}
	}

	method desecharObjeto(unObjeto) {
		objetosGuardados.remove(unObjeto)
	}
}
	
object mochilaChica inherits Mochila(categoria="mochila", peso = 15, imagen="objeto/mochilaChica.png"){}
object mochilaGrande inherits Mochila(categoria="mochila", peso = 20, imagen="objeto/mochilaGrande.png"){}