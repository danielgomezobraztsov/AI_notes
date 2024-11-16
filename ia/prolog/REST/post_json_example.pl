:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/json)).

:- http_handler(root(suma), suma_reply, []).		
:- http_handler(root(simple_post), simple_post_reply, []).		

server(Port) :-					
    http_server(http_dispatch, [port(Port)]).

% curl --header "Content-Type: application/json" --request POST --data '{"sumando_1":"5","sumando_2":"7"}' http://localhost:5000/suma
suma_reply(Request) :-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    atom_json_term(Data, json([sumando_1=X, sumando_2=Y]), []),
    atom_number(X, N1),
    atom_number(Y, N2),
    N3 is N1 + N2,
    format('Content-type: application/json~n~n', []),
    json_write_dict(current_output, json([ suma = N3])).

simple_post_reply(Request) :-
    http_read_data(Request, Data, []),
    format('Content-type: application/json~n~n', []),
    json_write(current_output, ejemplo{result:ok}).
