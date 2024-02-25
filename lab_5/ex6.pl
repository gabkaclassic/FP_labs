male(john).
male(mike).
female(anna).
female(lucy).
parent(john, anna).
parent(john, lucy).
parent(anna, mike).
parent(lucy, mike).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

?- sibling(anna, lucy).
% ?- ancestor(john, mike).
% ?- ancestor(john, john).
% ?- sibling(john, john).
% ?- ancestor(anna, mike).
% ?- ancestor(lucy, mike).

