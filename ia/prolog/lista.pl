# suma de lista vacia es 0
suma([],0).
suma([X | Resto], Suma):- 
    suma(Resto, SumaResto),
    Suma is X + SumaResto.


# paresDeLista([],[]).
# paresDeLista([X | Resto], [X | RestoPares]):-
#     0 is X mod 2,
#     paresDeLista(Resto, RestoPares).
# paresDeLista([X | Resto], RestoPares):-
#     1 is X mod 2,
#     paresDeLista(Resto, RestoPares).

paresDeLista([],[]).
paresDeLista([X | Resto], [X | RestoPares]):-
    X rem 2 =:= 0,
    paresDeLista(Resto, RestoPares).
paresDeLista([X | Resto], RestoPares):-
    X rem 2 =\= 0,
    paresDeLista(Resto, RestoPares).

escalarPorListas(0,[],[]).
escalarPorListas(Esc, [X | Resto], [Y | Resto]):-
    Y is Esc * X,
    escalarPorListas(Esc, Resto, Resto).
