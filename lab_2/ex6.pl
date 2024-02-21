compare_elements(X, Y, Result) :-
    ( 
        X < Y -> Result = less ;
        X > Y -> Result = greater ;
        Result = equal
    ).

split_list(List, Left, Right) :-
    length(List, Len),
    HalfLen is Len // 2,
    length(Left, HalfLen),
    append(Left, Right, List).

merge([], Right, Right).
merge(Left, [], Left).
merge([HLeft|TLeft], [HRight|TRight], [HLeft|Sorted]) :-
    compare_elements(HLeft, HRight, less),
    merge(TLeft, [HRight|TRight], Sorted).
merge([HLeft|TLeft], [HRight|TRight], [HRight|Sorted]) :-
    compare_elements(HLeft, HRight, greater),
    merge([HLeft|TLeft], TRight, Sorted).
merge([H|TLeft], [H|TRight], [H|Sorted]) :-
    merge(TLeft, TRight, Sorted).

merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    split_list(List, Left, Right),
    merge_sort(Left, SortedLeft),
    merge_sort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Sorted).

sortBy(Comparator, List, Sorted) :-
    merge_sort(List, Sorted).

compare_numbers(X, Y, Result) :-
    compare(Result, X, Y).

:- 
    List = [5, 3, 8, 2, 7],
    sortBy(compare_numbers, List, Sorted),
    writeln(Sorted).
