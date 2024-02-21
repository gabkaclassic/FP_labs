antimap([], _, []) :- !.
antimap([F|Tail], E, [Result|Results]) :-
    antimap(Tail, E, Results),
    Goal =.. [F, E, Result], 
    call(Goal).

f1(X, Y) :- Y is X+2, !.
f2(X, Y) :- Y is X*3, !.
f3(X, Y) :- Y is X*X, !.

main :-
    Functions = [f1, f2, f3],
    antimap(Functions, 2, Results),
    write(Results).

:- initialization(main).