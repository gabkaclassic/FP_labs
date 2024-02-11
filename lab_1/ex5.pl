rle_encode([], []) :- !.
rle_encode([X], [X]) :- !.

rle_encode([H, H|T], [{H, Count}|Result]) :-
    count_repeats([H, H|T], H, Count, Rest),
    rle_encode(Rest, Result).

rle_encode([H1, H2|T], [H1|Result]) :-
    dif(H1, H2),
    rle_encode([H2|T], Result).

count_repeats([], _, 0, []) :- !.

count_repeats([X|T], X, Count, Rest) :-
    count_repeats(T, X, CountTail, Rest),
    Count is CountTail + 1.

count_repeats([X|T], Y, 0, [X|T]) :-
    dif(X, Y).


main :-

    rle_encode([a,a,a,b,c,c,a,a], Result),
    writeln(Result).

:- initialization(main).