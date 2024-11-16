:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/json)).

:- http_handler(root(javascript), javascript_reply, []).		

server(Port) :-					
    http_server(http_dispatch, [port(Port)]).

javascript_reply(_Request) :-
    format('Content-type: text/html~n~n'),
    format('<!DOCTYPE html>~n', []),
    format('<html>~n', []),
    format('<body>~n', []),
    format('<h2>My First JavaScript</h2>~n',[]),
    format('<button type="button" onclick="document.getElementById(\'demo\').innerHTML = Date()">~n', []),
    format('Click me to display Date and Time.</button>~n', []),
    format('<p id="demo"></p>~n', []),
    format('</body>~n', []),
    format('</html>~n', []).
