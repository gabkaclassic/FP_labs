father(ivan, nastya).
father(ivan, maria).
father(ivan, petr).
parent(maria, anna).
parent(maria, alex).
parent(petr, elena).
parent(anna, maria).
parent(anna, petr).
parent(anna, alex).
parent(julia, maria).
parent(julia, ivan).
parent(julia, petr).
parent(petr, anna).
female(julia).
female(anna).
female(maria).
female(nastya).

happy(Person) :-
    parent(Person, _).

% Предикат для проверки, является ли X тётей Y
aunt(X, Y) :-
    parent(Z, Y), % Z - родитель Y
    sister(X, Z). % X - сестра Z

% Предикат для проверки, является ли X сестрой Y
sister(X, Y) :-
    female(X), % X - женщина
    parent(Z, X), % Z - родитель X
    parent(Z, Y), % Z - также родитель Y
    X \= Y. % X и Y различны (X не является Y)
% 3
% ?- father(_, nastya).
% ?- parent(ivan, _).
% ?- parent(_, anna).
% ?- parent(anna, _).

% 4
% ?- happy(ivan).
% ?- happy(maria).

% 5
% ?- aunt(petr, maria).
% ?- aunt(maria, anna).
?- aunt(ivan, anna).
% ?- aunt(julia, anna).
