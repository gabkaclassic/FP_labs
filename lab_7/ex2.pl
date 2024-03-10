dot([], [], 0).

dot([X|Xs], [Y|Ys], DotProduct) :-
    dot(Xs, Ys, Rest), 
    DotProduct is X * Y + Rest.

?- 
    dot([1,2,3], [4,5,6], Result),
    writeln(Result).

?- 
    dot([0,0,0], [4,5,6], Result),
    writeln(Result).

?- 
    dot([0,4,1], [4,5,6], Result),
    writeln(Result).

?- 
    dot([], [], Result),
    writeln(Result).

?- 
    dot([1], [], Result),
    writeln(Result).
