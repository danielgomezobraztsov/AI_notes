number(i,1).
number(v,5).
number(x,10).
number(l,50).
number(c,100).
number(n,1000).

roman([],0).
roman([X],N):- number(X,N).
roman([X,Y|Resto],N):-
    number(X,N1),
    number(Y,N2),
    N1 < N2,
    roman(Resto,N3),
    N is N2 - N1 + N3.