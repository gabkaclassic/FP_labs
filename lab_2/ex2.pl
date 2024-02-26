dropwhile(_, [], []).
dropwhile(Pred, [X|Xs], Result) :-
    call(Pred, X), 
    !, 
    dropwhile(Pred, Xs, Result).
dropwhile(Pred, List, List). 

pred(X) :-
    X mod 2 =:= 0.

main :-
    dropwhile(pred, [2, 4, 9, 11, 6], Result),
    writeln(Result).

:- initialization(main).