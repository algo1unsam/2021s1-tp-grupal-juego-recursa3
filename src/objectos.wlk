class objeto {
	var categoria
	var peso
}

object escudo{
	var defensa
}

object espada{
	var danio
}

object mochila{
	var objetosGuardados = []
	
	method controlarPeso(){
		
	}

	method agregarObjeto(unObjeto){
		objetosGuardados.add(unObjeto)
	}
	
	method desecharObjeto(unObjeto){
		objetosGuardados.remove(unObjeto)
	}
}