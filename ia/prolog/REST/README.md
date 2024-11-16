CÓMO EJECUTAR LOS PROGRAMAS PROPORCIONADOS
==========================================

Uso de `simple_server.pl`
-------------------------

1.  Abra una consola de Linux.
2.  Posiciónese donde esté el fichero `simple_server.pl`.
3.  Ejecute SWI Prolog con dicho fichero:

```bash
swipl simple_server.pl
```

4.  Levante el servidor, por ejemplo, en el puerto 5000:

```
?- server(5000).
```

5.  En el navegador, escriba la siguiente URI:

```
localhost:5000/hello_world
```

Uso de `serving_html.pl`
------------------------

1.  Abra una consola de Linux.
2.  Posiciónese donde esté el fichero `serving_html.pl`.
3.  Ejecute SWI Prolog con dicho fichero:

```bash
swipl serving_html.pl
```

4.  Levante el servidor, por ejemplo, en el puerto 5000. Si ya tiene
    levantado un servidor en el mismo puerto, tiene dos alternativas:
    (a) ir a la consola de Prolog donde lo ha levantado, pulse `Ctrl+C`, y
    escriba `halt` en la consola de Prolog; o (b) levante el nuevo servidor
    en otro puerto. En adelante se asumirá que el nuevo servidor escucha en
    el puerto 5000.

```
?- server(5000).
```

5.  En el navegador, escriba la siguiente URI:

```
localhost:5000/simple_html

6.  También en el navedor, escriba la siguiente URI:

```
localhost:5000/html_table
```

Uso de `serving_js.pl`
----------------------

1.  Abra una consola de Linux.
2.  Posiciónese donde esté el fichero `serving_js.pl`.
3.  Ejecute SWI Prolog con dicho fichero:

```bash
swipl serving_js.pl
```

4.  Levante el servidor, por ejemplo, en el puerto 5000:

```
?- server(5000).
```

5.  En el navegador, escriba la siguiente URI:

```
localhost:5000/simple_js

6.  También en el navedor, escriba la siguiente URI:

```
localhost:5000/javascript
```

7.  Pulse en el botón que le aparece en el navegador.

Uso de `post_example.pl`
------------------------

1.  Abra una consola de Linux.
2.  Posiciónese donde esté el fichero `post_example.pl`.
3.  Ejecute SWI Prolog con dicho fichero:

```bash
swipl post_example.pl
```

4.  Levante el servidor, por ejemplo, en el puerto 5000:

```
?- server(5000).
```

5.  Abra otra consola de Linux y escriba la siguiente instrucción:

```bash
curl -d "sumando_1=5&sumando_2=7" -X POST http://localhost:5000/suma
```

Uso de `post_json_example.pl`
-----------------------------

1.  Abra una consola de Linux.
2.  Posiciónese donde esté el fichero `post_json_example.pl`.
3.  Ejecute SWI Prolog con dicho fichero:

```bash
swipl post_json_example.pl
```

4.  Levante el servidor, por ejemplo, en el puerto 5000:

```
?- server(5000).
```

5.  Abra otra consola de Linux y escriba la siguiente instrucción:

```bash
curl --header "Content-Type: application/json" --request POST --data '{"sumando_1":"5","sumando_2":"7"}' http://localhost:5000/suma
```
