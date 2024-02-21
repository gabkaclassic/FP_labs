fun(X, Value) :- Value is X*X - 2.

check_sign(Value, Positive) :- Positive is sign(Value).

solve(Fun, A, B, Eps, X) :-
    fun(A, FA), 
    fun(B, FB),  
    check_sign(FA, PositiveA), 
    check_sign(FB, PositiveB), 
    (
        PositiveA =:= PositiveB ->  
            writeln('Sign on A and B points are equal');

        (abs(B - A) < Eps ->
            X is (A + B) / 2;
            X1 is (A + B) / 2,
            fun(X1, FX1),
            check_sign(FX1, PositiveX1),

            (
                PositiveA =:= PositiveX1 ->
                    solve(Fun, X1, B, Eps, X);
                    solve(Fun, A, X1, Eps, X)
            )
        )
    ).

:- 
    solve(fun, 0, 2, 0.001, X), 
    writeln(X).
