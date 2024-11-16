:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/json)).

:- http_handler(root(html_table), html_table_reply, []).		
:- http_handler(root(simple_html), simple_html_reply, []).		
:- http_handler(root(buenos_dias), saludo, []).		

server(Port) :-					
    http_server(http_dispatch, [port(Port)]).

saludo(_Request) :-		
    format('Content-type: text/plain~n~n'),
    format('Hello World!~n').

simple_html_reply(_Request) :-
        format('Content-type: text/html~n~n'),
		format('<html><head><title>Howdy</title></head><body><h2>A Simple Web Page</h2><p>With some text.</p></body></html>~n').

html_table_reply(Request) :-
    format('Content-type: text/html~n~n', []),
    format('<html>~n', []),
    format('<table border=1>~n'),
    print_request(Request),
    format('~n</table>~n'),
    format('</html>~n', []).

print_request([]).
print_request([H|T]) :-
    H =.. [Name, Value],
    format('<tr><td>~w<td>~w~n', [Name, Value]),
    print_request(T).
