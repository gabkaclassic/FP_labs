triangle(N, Result) :-
    N < 1,
    Result = ':('.
triangle(1, 1).
triangle(N, NthTriangle) :-
    N > 1,
    N1 is N - 1,
    triangle(N1, PrevTriangle),
    NthTriangle is PrevTriangle + N.

?- 
    triangle(4, X),
    writeln(X).

?- 
    triangle(1000, X),
    writeln(X).

?- 
    triangle(-1, X),
    writeln(X).