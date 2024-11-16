# p(X):- q(X), r(X), !.
# p(X):- s(X).
# q(a).
# q(b).
# r(a).
# r(b).
# s(c).

p(X,Y):- q(X), r(Y).
q(a).
q(b).
r(c).
r(d).
