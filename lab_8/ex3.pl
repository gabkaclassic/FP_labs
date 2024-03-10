delete_elem(_, [], []).
delete_elem(Elem, [Elem|T], T) :- delete_elem(Elem, T, T).
delete_elem(Elem, [H|T], [H|Result]) :- Elem \= H, delete_elem(Elem, T, Result).

set_union([], List2, List2).
set_union([H|T], List2, Result) :- member(H, List2), !, set_union(T, List2, Result).
set_union([H|T], List2, [H|Result]) :- set_union(T, List2, Temp), delete_elem(H, Temp, Result).


?- 
    set_union([1,2,3,4,5], [3,5,6,7,8], X),
    writeln(X).