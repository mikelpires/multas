=========================
MULTAS
=========================

**APP web para registrar infracciones de tráfico.**

**Las capturas actuales se muestran en una vista de diseño adaptable a tamaño "iPhone X" dado que su funcion final es su uso en movil aun que se adapta a cualquier tipo de pantalla (responsive design)**



TECNOLOGIAS
----------------
**JAVAEE, MySQL, proyecto mavenizado 3.0**

**Uso de JSTL expression language**

**Html,Css,Js,Jquery**


Apendice Base de Datos [MySql (InnoDB)]
-------------------------------
**El fichero donde se especifica la base de datos se encuentra en**

         src/main/resources/database.properties 

                 
**El fichero donde se encuentran las instrucciones SQL para la creación de la base de datos con unos ejemplos precargados es el**

         dgt.sql 

DIAGRAMA ENTIDAD-RELACION
----------------

.. image:: readme/er.png

    
UX
----------------
**Para empezar, debemos logearnos con el numero de placa y contraseña del agente:**

.. image:: readme/login.png

**En la pagina principal podemos seleccionar entre cuatro opciones, "Ver Multas", "Multar", "Multas anuladas" y "Ver estadisticas":**

.. image:: readme/menu.png

**Al seleccionar "Ver Multas" nos llevara a un listado con las multas que tiene almacenadas
en la base de datos ese agente.**

.. image:: readme/listado1.png

**Tambien se puede filtrar por matricula, aunque se ordena automaticamente por fecha descendente
Al pinchar en el "+" nos despliega el detalle de dicha multa, asi como la opción de anularla**

.. image:: readme/listado2.png

**Para volver al menu tenemos 2 opciones, o con la flecha azul de atrás o desplegando el menu oculto en el que también podemos cerrar la sesión**

.. image:: readme/listado3.png


.. image:: readme/menu.png

**Vamos a ver las multas anulada de dicho agente, y como se pueden volver a habilitar en caso de que fuera un error**


.. image:: readme/listadoanuladas.png

.. image:: readme/modal.png
**Al seleccionar "Multar" nos llevara a un formulario para buscar matriculas de coche, si
la matricula existe en la base de datos nos mandara a otro formulario para poder registrarle
una nueva multa. Sino existe la matricula te dira que no se encuentra en la base de datos y
que pruebes con otra diferente.**

.. image:: readme/menu.png

.. image:: readme/buscar.png

.. image:: readme/multar.png

.. image:: readme/multar2menu.png

**Y por ultimo tenemos los objetivos del agente, donde puede ver un detalle del año y de años anteriores de sus objetivos**


.. image:: readme/objetivos1.png


.. image:: readme/objetivos2.png


-Control de errores:
--------------------------
--Errores a nivel de web
------------------------
**Si se intenta acceder a una pagina que no existe se muestra la siguiente portada**

.. image:: readme/404.png

**Y en caso de un error inesperado por parte de la aplicación o de intentar corromper el funcionamiento normal de programa por voluntad propia, muestra el siguiente error**

.. image:: readme/500.png

--Errores a nivel de login
-----------------------------
**Datos de login incorrectos**

.. image:: readme/loginincorrecto.png

**Numero de placa erroneo**

.. image:: readme/loginincorrecto2.png

**Password erronea**

.. image:: readme/loginincorrecto3.png


--Errores a nivel de multar
-----------------------------

**Concepto insuficiente**

.. image:: readme/multarincorrecto1.png

**Tipo erroneo**

**En caso de saltarse la validacion html5**

.. image:: readme/multarincorrecto2.png
