intersect([], _, []).

intersect([X|Xs], Ys, [X|Zs]) :-
    member(X, Ys),
    !,
    intersect(Xs, Ys, Zs).

intersect([_|Xs], Ys, Zs) :-
    intersect(Xs, Ys, Zs).


main :-
    intersect([1, 3, 2, 5], [2, 3, 4], Result),
    writeln(Result).

:- initialization(main).