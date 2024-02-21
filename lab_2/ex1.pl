
sum_neg_squares([], 0) :- !.

sum_neg_squares([E|Tail], Sum) :- 
    number(E), E < 0,
    sum_neg_squares(Tail, RestSum),
    Sum is RestSum + E * E.

sum_neg_squares([_|Tail], Sum) :-
    sum_neg_squares(Tail, Sum).

main :-
    List = [3,'a',false,-3,1],
    sum_neg_squares(List, Sum),
    writeln(Sum).

:- initialization(main).