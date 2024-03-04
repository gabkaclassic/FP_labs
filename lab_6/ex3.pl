contains_duplicates(List) :- 
    setof(X, member(X, List), Set),
    length(List, Length1),
    length(Set, Length2),
    Length1 > Length2.

?- contains_duplicates([a,b,a,b,c,c,a]).

% ?- contains_duplicates([a,b,c]).

?- 
    X = c,
    contains_duplicates([a,b,X,c]).

?- 
    X = c,
    contains_duplicates([a,b,X]).

?-  contains_duplicates([]).
