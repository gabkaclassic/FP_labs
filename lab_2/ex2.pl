dropwhile(_, [], []) :- !.

dropwhile(Pred, [X|Xs], Result) :-
    call(Pred, X),
    !,
    dropwhile(Pred, Xs, Result).

dropwhile(Pred, [X|Xs], [X|Xs]) :-
    \+ call(Pred, X).

main :-
    dropwhile(>=(3), [1, 3, 9, 11, 6], Result),
    writeln(Result).

:- initialization(main).
