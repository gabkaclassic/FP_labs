% Предикат для проверки сопоставления шаблонов
match(X, Y) :-
    X = Y,
    writeln('Успешно:'), writeln(X).
match(X, _) :-
    writeln('Неудачно: '), writeln(X).

main :-
    match(meal(food(Y), X), meal(X, drink(Z))),
    match(food(bread, X, beer), food(Y, burger)),
    match(likes(X, cola), likes(Y, cola)),
    match('bread', bread),
    match(likes(X, food(Y)), likes(Y, food(Z))).

:- initialization(main).