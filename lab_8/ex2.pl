abs(X, Abs) :- X >= 0, !, Abs = X.
abs(X, Abs) :- Abs is -X.

?- 
    % abs(3, A),
    % writeln(A)

    % abs(-1, A),
    % writeln(A)

    abs(0, A),
    writeln(A)
    .