:- use_module(library(clpr)).

splitPlus(Expression, [Element | Elements]) :-
    Expression = E + Element,
    splitPlus(E, Elements).

splitPlus(Expression, [Expression]).

expression(Term, Coefficient, Variable, Power) :-
    (   number(Term) -> 
        Coefficient = 1,
        Variable = Term,
        Power = 1
    ;   Term =.. [Op, Arg1, Arg2],
        (   Op = '*',
            (   number(Arg1) -> 
                Coefficient = Arg1,
                (   Arg2 =.. ['^', Var, Pow] ->
                    Variable = Var,
                    Power = Pow
                ;   Variable = Arg2,
                    Power = 1
                )
            ;   number(Arg2) -> 
                Coefficient = Arg2,
                (   Arg1 =.. ['^', Var, Pow] ->
                    Variable = Var,
                    Power = Pow
                ;   Variable = Arg1,
                    Power = 1
                )
            )
        ;   Op = '^',
            Coefficient = 1,
            Variable = Arg1,
            Power = Arg2
        )
    ).

expression(x, C, x, P) :- C = 1, P = 1.

term(C, X, P).

splitTerms([Element | Elements], [Term | Terms]) :-
    expression(Element, C, X, P),
    Term = term(C, X, P),
    splitTerms(Elements, Terms).

splitTerms([], _).

checkTerms([term(C, _, P) | Terms], PP) :-
    ((P @>= PP, P =:= 1);
    (P @> PP)),
	C \= 0,
	checkTerms(Terms, P).

checkTerms([], _).

polynom(Expression) :-
    splitPlus(Expression, Elements),
    splitTerms(Elements, Terms),
    writeln(Terms),
    checkTerms(Terms, 0),
    writeln('Yes').


test_cases :-
    polynom(2*x^3 + x),              
    writeln('2*x^3 + x')

    % polynom(2*x^3 + 0*x + 1),        
    % writeln('2*x^3 + 0*x + 1')

    % polynom(2*x^3 + x^3 + 2),        
    % writeln('2*x^3 + x^3 + 2')

    % polynom(2*x^3 + x^2 + 1),        
    % writeln('2*x^3 + x^2 + 1')

    % polynom(2*x^3 + 0*x^2 + x + 1),  
    % writeln('2*x^3 + 0*x^2 + x + 1')

    % polynom(0*x^3 + 0*x^2 + 0*x + 0),
    % writeln('0*x^3 + 0*x^2 + 0*x + 0')

    % polynom(4*x^2 + x + 1),            
    % writeln('4*x^2 + x + 1')
    .            

?- test_cases.
