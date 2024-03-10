nu(X, Y) :-
    X = Y, !, fail.
nu(_, _).


?- 
    % nu(X, X),
    % nu(X, foo(Y)),
    nu(4, 5).
