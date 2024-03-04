zip([], [], []).
zip([X|Xs], [Y|Ys], [[X,Y]|Zipped]) :-
    zip(Xs, Ys, Zipped).

?- 
    zip([a,b,c], [1,2,3], X),
    writeln(X).

% ?- 
%     zip([a,b,c], [1,2,3,4], X),
%     writeln(X).

?- 
    zip([], [], X),
    writeln(X).

?- 
    zip([1,2,3], [a,b,c], X),
    writeln(X).



