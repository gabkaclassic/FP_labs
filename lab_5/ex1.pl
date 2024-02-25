term_type(Term, Type) :-
    var(Term),
    !,
    Type = variable.
term_type(Term, Type) :-
    atom(Term),
    !,
    Type = atom.
term_type(Term, Type) :-
    compound(Term),
    !,
    Type = compound_term.
term_type(_, not_a_term).

% Примеры использования
main :-
    term_type(_, Type1),
    writeln('Переменная:'), writeln(Type1),
    
    term_type('язык Пролог', Type2),
    writeln('Атом:'), writeln(Type2),
    
    term_type('Пролог', Type3),
    writeln('Атом:'), writeln(Type3),
    
    term_type('Альберт(любит, мясо)', Type4),
    writeln('Сложный терм:'), writeln(Type4),
    
    term_type('любит(Альберт, мясо)', Type5),
    writeln('Сложный терм:'), writeln(Type5).

:- initialization(main).