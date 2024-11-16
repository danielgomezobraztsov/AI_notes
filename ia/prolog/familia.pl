% Programa tomado del libro de Sterling y Shapiro, 1994.

% RULES

cousin(Cousin1, Cousin2) :-
    parent(Parent1, Cousin1),
    parent(Parent2, Cousin2),
    sibling(Parent1, Parent2).

sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    \+ (Sibling1 = Sibling2).

daughter(Woman, Person) :-
    parent(Person, Woman),
    female(Woman).

grandfather(Man, Person) :-
    father(Man, Parent),
    parent(Parent, Person).

grandmother(Woman, Person) :-
    mother(Woman, Parent),
    parent(Parent, Person).

parent(Parent, Person) :-
    mother(Parent, Person); father(Parent, Person).

son(Man, Person) :-
    parent(Person, Man),
    male(Man).

uncle(Man, Person) :-
    male(Man),
    sibling(Man, Brother),
    parent(Brother, Person).

brother(Man, Person) :-
    male(Man),
    sibling(Man, Person),
    \+ (Man = Person).

sister(Woman, Person) :-
    female(Woman),
    sibling(Woman, Person),
    \+ (Woman = Person).

nephew(Man, Person) :-
    male(Man),
    parent(Parent1, Man),
    sibling(Parent1, Person).

niece(Woman, Person) :-
    female(Woman),
    parent(Parent1, Woman),
    sibling(Parent1, Person).

marriage_with_kids(Man, Woman) :-
    male(Man),
    female(Woman),
    parent(Man, Child),
    parent(Woman, Child).

ascendant(X, Y) :- 
    parent(X, Y). 

ascendant(X, Y) :- 
    parent(X, Z),
    ascendant(Z, Y). 


parte(X,X).

parte_directa(X,Y) :- 
    

% FACTS

father(terah, abraham).
father(terah, nachor).
father(terah, haran).
father(abraham, isaac).
father(haran, lot).
father(haran, milcah).
father(haran, yiscah).

mother(sarah, isaac).

male(terah).
male(abraham).
male(nachor).
male(haran).
male(isaac).
male(lot).

female(sarah).
female(milcah).
female(yiscah).









