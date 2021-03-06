<img src="picture\presentacion\recursa3.jpg" width='600'>
<br><br>

#   ```INSTRUCCIONES DEL JUEGO```
<img src="assets\pantallas\tutorial.jpg">
<br><br>
<img src="assets\pantallas\objetos.jpg">
<br><br>
<img src="assets\pantallas\enemigos.jpg">

<br><br>

# ```EXPLICACION DEL JUEGO```
### El juego consiste en poder atravesar los <b>```3 laberintos```</b> para poder enfrentar al guardián de la mazmorra, pero no va a ser tan fácil.
### <b>```Los laberintos cuentan con zonas, identificadas por colores```</b>, que son vigiladas por los súbditos del guardián, quienes al sentir que estás cerca empezaran a perseguirte hasta que logres acabar con ellos.
### Presta mucha atención a los cofres, que nos proporcionaran objetos para poder defendernos de la amenaza, estos cofres nos pueden dar Espadas, Escudos o Vida.
### <b>```Al eliminar a los enemigos dropearas llaves que te permitirán acceder a las zonas```</b>, así que no intentes avanzar sin desafiar a los súbditos si no nunca saldrás. 
# <b>```Nivel 1:```</b>
<img src="picture\presentacion\Nivel1.jpeg">
<br>

# <b>```Nivel 2:```</b>
<img src="picture\presentacion\Nivel2.jpeg">

# <b>```Nivel 3:```</b>
<img src="picture\presentacion\Nivel3.jpeg">
<br><br>

#   ```DIAGRAMA DE ARQUITECTURA```
<img src="picture\presentacion\tp_algo1.drawio.png">
<br><br>

# ```CONCEPTOS DE LOS METODOS```

# imagen.wlk:
*   ### Clase Imagen:
    ```python
        1.  esAtravesable() # Nos dira si un objeto puede o no ser atravesable. 
        2.  teEncontro()    # Dependera de cada objeto 
        3.  interactuarConObjeto()  # Se utiliza para interactuar con los objetos del juego apretando la letra E
    ```

# objetos.wlk:
*   ### Clase Objeto inherits Imagen:
    ```python
        1.  interactuarConObjeto() # Dependera de cada objeto
        2.  utilizarObjeto()    # Dependera de cada objeto
    ```
<!-- *   ### Clase Espada:
    ```python
        1.  utilizarObjeto()    # Se utiliza para realizar el ataque con el objeto
    ``` -->
*   ### Clase Mochila inherits Objeto:
    ```python
        1.  agregarObjeto(unObjeto) # Este metodo servira para recoger los objetos del juego. En caso de las espadas y de los escudos procedera tambien a equiparselo en las manos del personaje.
        2.  desecharObjeto(unObjeto) # Se utiliza para remover un objeto de la mochila
        3.  objetosGuardados() # Devuelve la coleccion de los objetos guardados
        4.  llaves() # Devuelve la coleccion de las llaves. 
    ```
*   ### Clase Cofres inherits Objeto:
    ```python
        1.  interactuarConObjeto() # Procederá a validar que el cofre no este vacío y que el personaje tenga una mochila. Una vez validado el punto anterior mirara si tiene llaves. Luego de validar utilizara la llave o saldrá un mensaje de advertencia 
    ```
*   ### Clase Llave inherits Objeto:
    ```python
        1.  utilizarObjeto() # Procedera a desechar la llave y remover la imagen en el juego
    ```
*   ### Clase Corazon inherits Objeto:
    ```python
        1.  utilizarObjeto() # Le dara vida al personaje utilizando el metodo recibirVida del personaje.
    ```    
<br><br>

# individuos.wlk:
*   ### Clase Individuo inherits Imagen:
    ```python
        1.  moverse(direccion) # Controla el movimiento y direccion del personaje
        2.  moverHaciaSiSePuede(personaje, direccion) # Controlara si puede atravezar un obstaculo
        3.  puedeMoverse(posicion) # Hace el llamado de moverHaciaSiSePuede para controlar que pueda moverse
        4.  moverHacia(personaje, direccion) # Se ultiliza para mover de posicion al personaje
        5.  atacar() # Depende del individuo
        6.  recibirDanio(danio) # El Individuo recibira daño y dependiendo si lleva escudo o no recibira mas o menos daño
        7.  estaMuerto() # Si al individuo se le agotaron la vida se removera la imagen de dicho individuo en el juego.
        8.  murio() # Depende del individuo
        9.  mostrarVida() # Mostrara la visa en el tablero del juego
    ```
*   ### Objeto personaje inherits Individuo:
    ```python
        1.  equiparObjetoMano1(unObjeto) # Equipara un objeto a la mano 1
        2.  equiparObjetoMano2(unObjeto) # Equipara un objeto a la mano 2
        3.  utilizarObjeto(unObjeto) # Usara el metodo utilizarObjeto del objeto que tenga equipado
        4.  interactuarConObjetos() # El metodo permitira que el personaje pueda interactuar con otros objetos en el juego, ya se porque esta en la misma posicion o porque lo tiene delante del mismo. 
        5.  agregarObjeto(unObjeto) # Revisara si el objeto que quiere agregar es una mochila, le agregara la mochila como un atributo al personaje. En caso de querer agarrar un objeto distinto de la mochila, revisara si el personaje tiene una mochila y llamara al methodo de la mochila agregarObjeto. De lo contrario arrojara un mensaje.
        6.  desecharObjeto(unObjeto) # Desechara el objeto que se le pase como parametro. 
        7.  cantidadLlaves() # Devolvera el resultado del metodo llaves() de la mochila, por lo que obtendremos la cantidad de llaves que tiene el personaje
        8.  atacar() # Revisara si el personaje tiene algun objeto en la mano para poder atacar, en caso de tener el objeto para atacar, procede a realizar el ataque y si el enemigo esta en frente dicho enemigo recibira daño. Si no tiene un objeto se mostrara un mensaje por pantalla.  
        9.  image() # Segun la accion que realiza el personaje se mostrara su animacion
        10. murio() # Mostrara la pantalal de Game Over
        11. recibirVida() # El personaje recibe vida y se refleja en el panel del juego
    ```
*   ### Objeto enemigo inherits Individuo:
    ```python
        1. atacar() # Hace el llamado al personaje para ejecutar el metodo de recibirDanio()
        2. teEncontro() # Si te encontro procede a utilizar el metodo atacar()
        3. moverse() # Metodo para automatizar el movimiento del enemigo cada 1 segundo moviendose hacia el enemigo
        4. direccionMasConveniente() # Dada la diferencia entre las posiciones del enemigo y del personaje establecera la mejor direccion para perseguir al personaje.
        5. moverseHaciaJugador() # Hace el llamado a direccionMasConveniente() y a moverHaciaSiSePuede() con el fin de que el enemigo pueda o no moverse hacia el personaje. 
        6. direccionesAtravesables()
        7. image() # establece la imagen del enemigo en el juego
        8. murio() # Se remueve la imagen del enemigo al morir
        9. recibirDanio() # Quitara el visual de la vida cuando reciba daño
    ```
    <br><br>
    # ```COMPORTAMIENTO DE LOS BLOQUES GRAFICOS```
    Todos los objetos heredan el atributo esAtravesable de la clase ```Imagen```. 

    El atributo ```esAtravesable``` es de tipo Booleano con el fin de indicarnos si un objeto puede o no ser atravesado. 

    Los objetos PAREDES y BLOQUES tienen dicho atributo seteado en ```false```.

    El objeto salidas eliminará todo objeto donde se coloque la salida y pondrá la imagen que corresponda con el valor de ```esAtravesable``` como ```True```

    <br><br>    
    # TEST REALIZADOS
    ```python
        import paqueteSecundario.individuos.*
        import paqueteSecundario.objetos.*
        import wollok.game.*
        import paquetePrimario.configuracion.*
        import paquetePrimario.menu.*
        import paqueteSecundario.direcciones.*
        import paqueteSecundario.estados.*
        describe "TEST DE INDIVIDUO" {

            const enemigo0 = new Enemigo(vida = 2, ataque = 1, position = game.at(5, 6), orientacion = arriba, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo',posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3())
            const enemigo1 = new Enemigo(vida = 2, ataque = 2, position = game.at(5, 6), orientacion = arriba, imagen = "enemigo/enemigoZombieChicoDerecha.png", categoria = 'enemigo',posicionCorazon1 = menu.posicionCorazonEnemigo1(), posicionCorazon2 = menu.posicionCorazonEnemigo2(), posicionCorazon3 = menu.posicionCorazonEnemigo3())
            
            const llaveCofre = new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre())
            const llaveCofre2 = new Llave(categoria = "llave", peso = 0, imagen = "llave/llaveCofre.png", position = menu.posicionLlaveCofre())
            
            fixture {
                personaje.position(game.at(5, 5))
                personaje.orientacion(arriba)
                game.addVisual(enemigo0)
                game.addVisual(personaje)
                personaje.agregarObjeto(mochilaChica)
                personaje.agregarObjeto(espadaChica)
                personaje.agregarObjeto(llaveCofre2)
                personaje.agregarObjeto(llaveCofre)
                game.onTick(1000, "perseguir" + enemigo0, { true}) // Se hardcodea porque el enemigo en el juego se mueve y es necesario para testear.
                configuraciones.configurarColisiones()
                
                
            }

            test "EL INDIVIDUO TIENE MOCHILA CHICA Y DENTRO DE LA MOCHILA TIENE UNA ESPADA CHICA Y DOS LLAVES" {
                assert.equals(mochilaChica, personaje.mochila())
                assert.equals([ mochilaChica,espadaChica, llaveCofre2,llaveCofre], mochilaChica.objetosGuardados())
            }
            test "EL INDIVIDUO TIENE MOCHILA GRANDE Y DENTRO DE LA MOCHILA TIENE UNA ESPADA CHICA Y UN ESCUDO GRANDE Y DOS LLAVES" {
                personaje.agregarObjeto(mochilaGrande)
                personaje.agregarObjeto(escudoGrande)
                assert.equals(mochilaGrande, personaje.mochila())
                assert.equals([mochilaChica,espadaChica, llaveCofre2,llaveCofre,mochilaGrande,escudoGrande], mochilaGrande.objetosGuardados())
            }

            test "EL INDIVIDUO DECIDE DEJAR UN OBJETO PORQUE LE OCUPA ESPACIO" {
                personaje.desecharObjeto(espadaChica)
                assert.equals([mochilaChica,llaveCofre2,llaveCofre], mochilaChica.objetosGuardados())
            }

            test "EL INDIVIDUO AL AGARRAR LA ESPADA GRANDE Y MANTIENE AMBAS ESPADAS PERO OCUPA LA ESPADAGRANDE." {
                personaje.agregarObjeto(mochilaGrande)
                personaje.agregarObjeto(espadaGrande)
                assert.that(mochilaGrande.objetosGuardados().any({ objeto => objeto == espadaChica}))
                assert.notThat(personaje.mano1() == espadaChica)
                assert.that(mochilaGrande.objetosGuardados().any({ objeto => objeto == espadaGrande}))
                assert.that(personaje.mano1() == espadaGrande)
            }

            test "EL personaje AGARRA 3 LLAVES MAS Y UTILIZA UNA, LE QUEDAN 4" {
                3.times({ i => personaje.agregarObjeto(llaveCofre)})
                personaje.utilizarObjeto(llaveCofre)
                assert.equals(4, personaje.cantidadLlaves())
            }

            test "EL personaje ATACA A UN RIVAL HASTA DEJARLO CON 1 VIDA" {
                personaje.atacar()
                assert.equals(1, enemigo0.vida())
            }

            test "EL personaje ATACA AL enemigo0 HASTA MATARLO" {
                2.times({ i => personaje.atacar()})
                assert.equals(0, enemigo0.vida())
                assert.notThat(game.hasVisual(enemigo0))
            }

            test "EL ENEMIGO ATACA AL PERSONAJE 5 VECES, Y ESTE QUEDA CON 5 PUNTOS DE VIDA GRACIAS A LA PROTECCION DEL ESCUDO." {
                personaje.agregarObjeto(mochilaGrande)
                personaje.agregarObjeto(escudoGrande)
                enemigo0.teEncontro()
                enemigo0.teEncontro()
                enemigo0.teEncontro()
                enemigo0.teEncontro()
                enemigo0.teEncontro()
                assert.equals(5, personaje.vida())
            }
            test "EL ENEMIGO2 ATACA AL PERSONAJE 2 VECES, Y ESTE QUEDA CON 5 PUNTOS DE VIDA GRACIAS A LA PROTECCION DEL ESCUDO." {
                personaje.agregarObjeto(mochilaGrande)
                personaje.agregarObjeto(escudoGrande)
                enemigo1.teEncontro()
                enemigo1.teEncontro()
                enemigo1.teEncontro()
                assert.equals(4, personaje.vida())
            }
            test "Me devuelve una llave"{
                assert.equals(llaveCofre2,personaje.mochila().objetosGuardados().find({objeto => objeto.categoria()=='llave'}))
                
            }
        }


    ```

    