delta([], []).
delta([_], []).

delta([Previous, Next|Tail], [Diff|Result]) :-
    Diff is Next - Previous,
    delta([Next|Tail], Result).

main :-
    List = [1,2,4,3],
    delta(List, DeltaList),
    writeln(DeltaList).

:- initialization(main).


