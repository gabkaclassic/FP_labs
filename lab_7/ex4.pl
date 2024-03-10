combination(_, 0, []).
combination([X|Xs], K, [X|Ys]) :-
    K > 0,
    K1 is K - 1,
    combination(Xs, K1, Ys).
combination([_|Xs], K, Ys) :-
    K > 0,
    combination(Xs, K, Ys).

all_combinations(List, K, Combinations) :-
    findall(Comb, combination(List, K, Comb), Combinations).



?- all_combinations([1,2,3,12,22,33,123], 2, C),
    writeln(C).
