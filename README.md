<img src="picture\presentacion\recursa3.jpg" width='600'>
<br><br>

#   ```INSTRUCCIONES DEL JUEGO```
<img src="picture\presentacion\movimientos.png">
<br><br>
<img src="picture\presentacion\objetos.png">
<br><br>
<img src="picture\presentacion\enemigo.png">

<br><br>

#   ```DIAGRAMA DE ARQUITECTURA```
<img src="picture\presentacion\tp_algo1.drawio.png">
<br><br>

# ```CONCEPTOS DE LOS METODOS```
# objetos.wlk:
*   ### Clase Objeto:
    ```python
        1.  interactuarConObjeto() # Dependera de cada objeto
        2.  utilizarObjeto()    # Dependera de cada objeto
    ```
*   ### Clase Espada:
    ```python
        1.  utilizarObjeto()    # Se utiliza para realizar el ataque con el objeto
    ```
*   ### Clase Mochila:
    ```python
        1.  controlarPeso() # Controla si la suma de los objetos que contiene es mayor que 0, en caso de ser mayor devolvera false. 
        2.  agregarObjeto(unObjeto) # Este metodo revisara el objeto que intenta agarra y procedera a desechar en caso de ya tener el objeto para agarra el nuevo. 
        3.  interactuarConObjeto()  # Pendiente
        4.  desecharObjeto(unObjeto) # Se utiliza para remover un objeto de la mochila
        5.  usarLlave() # Utiliza una llave de la mochila -1
    ```
*   ### Clase Cofres:
    ```python
        1.  interactuarConObjeto() # Procederá a validar que el cofre no este vacío y que el personaje tenga algún objeto guardado y que tenga una llave. Luego de validar utilizara la llave o saldrá un mensaje de advertencia 
    ```
*   ### Objeto llave:
    ```python
        1.  utilizarObjeto() # Utilizara el methodo usarLlave de la clase Mochila y luego validara si no hay mas llaves en la mochila para remover la imagen
    ```
<br><br>

# individuos.wlk:
*   ### Clase Individuo:
    ```python
        1.  moverse(direccion) # Controla el movimiento y direccion del personaje
        2.  moverHaciaSiSePuede(personaje, direccion) # Controlara si puede atravezar un obstaculo
        3.  puedeMoverse(posicion) # Hace el llamado de moverHaciaSiSePuede para controlar que pueda moverse
        4.  moverHacia(personaje, direccion) # Se ultiliza para mover de posicion al personaje
        5.  atacar() # Pendiente
        6.  recibirDanio(danio) # Al individuo se le restara vida dependiendo el objeto con que se lo ataque.
        7.  estaMuerto() # Si al individuo se le agotaron la vida se removera la imagen de dicho individuo en el juego.
        8.  murio() # Pendiente
        9.  mostrarVida() # Pendiente
    ```
*   ### Objeto personaje:
    ```python
        1.  equiparObjeto(unObjeto) # Equipara un objeto a la mano 1
        2.  utilizarObjeto(unObjeto) # Usara el metodo utilizarObjeto del objeto que tenga equipado
        3.  interactuarConObjetos(variosObjetos) # Se utiliza para que el individuo pueda conocer otro objeto segun los criterios de interactuar del mismo
        4.  agregarObjeto(unObjeto) # Revisara si el objeto que quiere agregar es una mochila le agregara la mochila como un atributo al personaje. En caso de querer agarrar un objeto distinto de la mochila, revisara si el personaje tiene una mochila y llamara al methodo de la mochila agregarObjeto. De lo contrario arrojara un mensaje.
        5.  desecharObjeto(unObjeto) # Desechara el objeto que se le pase como parametro. 
        6.  cantidadLlaves() # Devolvera la consutla a la mochila de las llaves()
        7.  atacar() # Revisara si el personaje tiene algun objeto en la mano para poder atacar, en caso de haber un enemigo en frente, procede a quitarle vida. Sino sale un mensaje de que no se puede atacar por no tener un objeto en la mano. 
        8.  image() # Segun la accion que realiza el personaje realizara una accion. 
        9.  murio() # Mostrara la pantalal de Game Over
        10. mostrarVida() # Mostrara en pantalla la vida del personaje, la cual a medida que pierda vida se ira modificando. 
    ```
*   ### Objeto enemigo:
    ```python
        1.  atacar() # Hace el llamado al personaje para ejecutar el metodo de recibirDanio()
        2.  agregarEnemigoNivel1() # Cargara los atributos del enemigo para la pantalla del nivel 1
        3.  agregarEnemigoNivel2() # Cargara los atributos del enemigo para la pantalla del nivel 2
        4.  agregarEnemigoNivel3() # Cargara los atributos del enemigo para la pantalla del nivel 3
        5.  teEncontro() # Si te encontro procede a utilizar el metodo atacar()
        6.  moverse() # Metodo para automatizar el movimiento del enemigo cada 1 segundo moviendose hacia el enemigo
        7.  direccionMasConveniente() # Dada la diferencia entre las posiciones del enemigo y del personaje establecera la mejor direccion para perseguir al personaje.
        8.  moverseHaciaJugador() # Hace el llamado a direccionMasConveniente() y a moverHaciaSiSePuede() con el fin de que el enemigo pueda o no moverse hacia el personaje. 
        9.  direccionesAtravesables()
        10. image() # establece la imagen del enemigo en el juego
        11. murio() # Se remueve la imagen del enemigo al morir
        12. mostrarVida() # Mostrara en pantalla la vida del personaje, la cual a medida que pierda vida se ira modificando. 
    ```
    <br><br>

    # TEST REALIZADOS
    ```python
        import paqueteSecundario.individuos.*
        import paqueteSecundario.objetos.*
        import wollok.game.*
        import paquetePrimario.configuracion.*
        import paqueteSecundario.direcciones.*

        describe "TEST DE INDIVIDUO" {

            const enemigo1 = new Enemigo(vida = 2, ataque = 1, position = game.at(5, 6), orientacion = arriba, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo')

            fixture {
                personaje.position(game.at(5, 5))
                personaje.orientacion(arriba)
                game.addVisual(enemigo1)
                game.addVisual(personaje)
                configuraciones.configurarColisiones()
                personaje.agregarObjeto(mochilaGrande)
                personaje.agregarObjeto(espadaChica)
                personaje.agregarObjeto(escudoGrande)
                game.onTick(1000, "Perseguir1", { true}) // Se hardcodea porque el enemigo en el juego se mueve y es necesario para testear.
            }

            test "EL INDIVIDUO TIENE MOCHILA GRANDE Y DENTRO DE LA MOCHILA TIENE UNA ESPADA CHICA Y UN ESCUDO GRANDE" {
                assert.equals(mochilaGrande, personaje.mochila())
                assert.equals([ espadaChica, escudoGrande ], mochilaGrande.objetosGuardados())
            }

            test "EL INDIVIDUO DECIDE DEJAR UN OBJETO PORQUE LE OCUPA ESPACIO" {
                personaje.desecharObjeto(espadaChica)
                assert.equals([ escudoGrande ], mochilaGrande.objetosGuardados())
            }

            test "EL INDIVIDUO AL AGARRAR LA ESPADA GRANDE DESECHA LA ESPADA CHICA." {
                personaje.agregarObjeto(espadaGrande)
                assert.notThat(mochilaGrande.objetosGuardados().any({ objeto => objeto == espadaChica}))
                assert.notThat(personaje.mano1() == espadaChica)
                assert.that(mochilaGrande.objetosGuardados().any({ objeto => objeto == espadaGrande}))
                assert.that(personaje.mano1() == espadaGrande)
            }

            test "EL personaje AGARRA 3 LLAVES Y UTILIZA UNA, LE QUEDAN 2" {
                3.times({ i => personaje.agregarObjeto(llave)})
                personaje.utilizarObjeto(llave)
                assert.equals(2, personaje.cantidadLlaves())
            }

            test "EL personaje ATACA A UN RIVAL HASTA DEJARLO CON 50 VIDA" {
                personaje.atacar()
                assert.equals(1, enemigo1.vida())
            }

            test "EL personaje ATACA AL enemigo1 HASTA MATARLO" {
                2.times({ i => personaje.atacar()})
                assert.equals(0, enemigo1.vida())
                assert.notThat(game.hasVisual(enemigo1))
            }

            test "EL ENEMIGO ATACA personaje, Y ESTE QUEDA CON 3 PUNTOS DE VIDA." {
                personaje.moverse(arriba)
                assert.equals(personaje.position(), enemigo1.position())

                assert.equals(3, personaje.vida())
            }
        }
    ```