sumaNPrimeros(0,0). 
sumaNPrimeros(N, Suma) :-
    N > 0,
    N1 is N - 1,
    sumaNPrimeros(N1, SumaNMenosUno),
    Suma is N + SumaNMenosUno.

factorial(0,1).
factorial(N,F):-
    N > 0,
    N1 is N - 1,
    factorial(N1, M),
    F is N * M.


potencia(Base,0,1).
potencia(Base, Exp, Res):-
    Exp > 0,
    E1 is Exp - 1,
    potencia(Base, E1, R1),
    Res is Base * R1.