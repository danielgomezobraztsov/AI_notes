% Código de http://www.swi-prolog.org/howto/http/HelloText.html
% Mirar también http://www.pathwayslms.com/swipltuts/html/index.html

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).

:- http_handler(root(suma), suma_reply, []).		

server(Port) :-					
    http_server(http_dispatch, [port(Port)]).

% curl -d "sumando_1=5&sumando_2=7" -X POST http://localhost:5000/suma
suma_reply(Request) :-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    format('Content-type: text/plain~n~n', []),
    member(sumando_1=X, Data),
    member(sumando_2=Y, Data),
    atom_number(X, N1),
    atom_number(Y, N2),
    N3 is N1 + N2,
    write(N3).
