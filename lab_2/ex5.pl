for(Init, Cond, Step, Body) :-
    call(Body, Init),  
    call(Cond, Init),  
    call(Step, Init, Next),  
    for(Next, Cond, Step, Body).

body(Value) :-
    PrintValue is Value*Value,
    writeln(PrintValue).

step(Value, Next) :-
    Next is Value / 2.

condition(Value) :-
    Value > 11.

?- for(555, condition, step, body).
