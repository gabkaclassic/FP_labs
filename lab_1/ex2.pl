from_to(N, M, []) :-
    N > M.

from_to(N, M, [N|Tail]) :-
    N =< M,
    Next is N + 1,
    from_to(Next, M, Tail).

main :-
    write('From: '),
    read(N),
    write('To: '),
    read(M),
    from_to(N, M, List),
    writeln(List).


:- initialization(main).