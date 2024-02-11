int_to_binary(Number, Result) :-
    Number =:= 0,
    Result = '0'.

int_to_binary(Number, Result) :-
    Number < 0,
    NegNumber is -Number,
    int_to_binary(NegNumber, PosResult),
    atom_concat('-', PosResult, Result).

int_to_binary(Number, Result) :-
    Number > 0,
    divmod(Number, 2, Quotient, Remainder),
    atom_number(Remain, Remainder),
    int_to_binary(Quotient, Result2),
    atom_concat(Result2, Remain, Result).

main :-
    write('Number: '),
    read(Number),
    int_to_binary(Number, Result),
    write(Result).

:- initialization(main).
