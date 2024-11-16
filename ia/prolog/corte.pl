%10/10/24
p(X) :- q(X) , r(X).
p(X) :- s(X).
q(a).
q(b).
r(a).
r(b).
s(c).

/*
Regla 1: true si X = a o X = b, q(a) y r(a)  y, q(b) y r(b)
Regla 2: true si c, s(c)
Si le damos a ;, explora la siguiente opción, por ejemplo, en este
caso, la primera rama en explorar sería la primera regla con la a, 
si usamos ";" con la b y, luego la segunda si volvemos a utilizar ";".
*/
/* Corte al inicio */
p(X) :- ! ,q(X) , r(X).
p(X) :- s(X).
q(a).
q(b).
r(a).
r(b).
s(c).

/*  
Cuando  se usa el operador "!" en la regla 1, no se desarrollan
el resto de  las reglas, por lo que solo se desarrolla la primera 
y se deja sin desarrollar la segunda
*/

/*
Consultamos P(X), y ve que de primeras hay dos reglas posibles o disponibles,
pero cuando entra en profundidad, y se da cuenta que esta !, entonces 
automaticamente desactiva la rama o regla 2
*/

/*
De forma más técnica, "Con corte al principio del antecedente de la 1º  regla"
Cuando se encuentra con la 2º regla, la descarta, y sigue su proceso con normalidad

Regla 1: true si X = a o X = b, q(a) y r(a)  y, q(b) y r(b)
*/


/* Corte en el medio */
p(X) :- q(X), ! , r(X).
p(X) :- s(X).
q(a).
q(b).
r(a).
r(b).
s(c).

/* 
De forma más técnica, "Con corte entre la q y la r de la 1º regla"
Cuando llega a la primera regla, avanza por la primera rama y confirma
que q(a) y q(b) existe, pero deja como en cuarentena q(b) (Con esto
me refiero a que no la usa, pero no la descarta de momento, solo la usaría
en caso de que r(a) no exista / q(b) mejor dicho, quedaría anotado pero
no desarrollado), y luego pasa a la segunda rama y confirma 
r(a), por lo que no considera q(b) para seguir avanzando, 
y ni siquiera mira de la existencia de r(b), 
Posteriormente descarta la 2º regla
*/

/*
Por lo que he entendido, no es que se descarte como tal, simplemente
no lo desarrolla si no se le pide con ";", Decide seguir un camino 
sabiendo que le queda pendiente un camino que no desarrolla, pero que
si se le pide, lo desarrolla, y si no se le pide, no lo desarrolla
*/

/*
Ejemplo de uso: 
Si en una cirujía, hay diferentes opciones de llevarla a cabo,
y se decide seguir con una opción, pero se deja pendiente la otra opción
por si la primera opción resulta no funcionar, y probar otra forma de 
de llegar a la solución
*/


/* Corte al final de la primera regla */
p(X) :- q(X) , r(X) , !.
p(X) :- s(X).
q(a).
q(b).
r(a).
r(b).
s(c).

/*
Solo sale X = a
*/

/*
Empieza por la primera regla, y si tiene éxito no desarrolla o se 
olvida de las demas % A nivel gráfico empieza desarrollando q(a), 
luego r(a), y como con eso le vale, no desarrolla la 2º rama q(b), 
ni la 2º regla
*/

///////////////////////////////////////////////////////////////////////

/* 
Caso en que no tiene el mismo efecto cortar entre deos predicados,
que cortar al final de la regla
*/

/* Corte en el medio */
p(X , Y) :- q(X) , ! , r(Y).
q(a).
q(b).
r(c).
r(d).

/* 
Cuando empieza, desarrolla q(a), y como tiene éxito, corta, y no desarrolla q(b),
quedando disponible r(c) o r(d) como opciones
*/

/* Corte al final */

p(X , Y) :- q(X) , r(Y), !.
q(a).
q(b).
r(c).
r(d).

/*
Mientras que en este caso solo se quedaría con la primera de cada rama,
q(a) y r(c), quedandose sin  desarrollar q(b) y r(d)

Funciona, explicado de una manera vulgar, como: Miro las opciones de q(X),
y me quedo con la primera opción, q(a), y no desarrollo q(b), paso a 
escoger r(Y), quedando me con r(c) % Si q(a) y r(c) me sirven, 
me quedo con estas opciones y no desarrollo nada más, a no ser que el 
usuario utilice ; (Visualizar, y en este caso desarrollar más opciones)
*/

% El Corte en mode de demostración día 16/10/2024
% Otra forma de explicar el corte
%Ejercicio 31

p(X) :- q(X) , r(X). % 1 Posibilidades en el paso 9
p(X) :- s(X). % 2 Posibilidades en el paso 9
q(a). % 3 Posibilidades para comenzar el paso 10
q(b). % 4 Posibilidades para comenzar el paso 10s
r(a). % 5
r(b).  % 6
s(c).  % 7

% Queremos comprobar si p(X) es verdadero
¬ p(X) hip % 8
¬ q(X) | ¬ r(X) res: 8 , 1 % 9
¬ r(a) X/a en 9 , 3 % 10
 % "Solución" res 10 , 5 => tore X = a % 11 
¬ r(b) X/b en 9 , 4 % 10' Cuando se presiona ; Sería como volver a la 
            % anterior decisión, recordar ejemplo viaje en coche Oviedo
 % "Solución res 10' , 6 % 11'
 ¬ S(X) res 8 , 2 % 9'' volvemos a presionar ;
 % "Solución X/b res 7 => true X = c  % 10''

%% Qué ocurre si incorporamos un corte???

p(X) :- ! , q(X) , r(X). % 1
p(X) :- s(X). % 2 
q(a). % 3 Posibilidades cuando voy a comenzar  el paso 12
q(b). % 4 Posibilidades cuando voy a comenzar  el paso 12
r(a). % 5
r(b).  % 6
s(c).  % 7
 
¬ p(X) hip %  8
% Ejecutamos el corte ( ! ) ,y luego ¬ q(X) | ¬ r(X) res 8 , 1  % 9
% Se ejecuta y con ello se elimina "2" % 10
¬ q(X) | ¬r(X) % 11
% Aclarativo => ¬ q(a) | ¬ r(a) X/a en 11
¬ r(a) X/a en 11 , 3 % 12
% "Solución" res 12 , 5 => true X = a % 13
¬ r(b) X/b en 11 res 4 % 12'
% "Solución" res 12' , 6 => true X = b % 13'

%% Qué ocurre si incorporamos un corte al final???
    % Seguimos buscando p(X) ? 
p(X) :- q(X) , r(X) , !. % 1
p(X) :- s(X). % 2 
q(a). % 3 Posibilidades cuando voy a comenar el paso 10
q(b). % 4 Posibilidades cuando voy a comenar el paso 10
r(a). % 5
r(b).  % 6
s(c).  % 7

¬ p(X) hip % 8
¬ q(X) | ¬ r(X) % 9 y además, motosierra 
¬ q(a) | ¬ r(a) X/a % 10 y además, motosierra X/a en 9
¬ r(a) X/a en 10 , 3 % 11 y además, motosierra
% "Solución" => true X = a % 12 y además, motosierra en ejecución, se realiza el corte
% Con esto nos quedamos con X = a para q(a) y r(a) % 13