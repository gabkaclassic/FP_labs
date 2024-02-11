ball_volume(R, Volume) :-
    Volume is (4/3) * pi * R * R * R.

main :- 
    write('Radius: '),
    read(Radius),
    ball_volume(Radius, Volume),
    format('Volume with radius ~w is ~w~n', [Radius, Volume]).

:- initialization(main).
