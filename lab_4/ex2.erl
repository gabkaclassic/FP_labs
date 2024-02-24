-module(ex2).
-export([start/1, send_to_child/2, stop/0]).

start(N) ->
    Parent = self(),
    Pids = [spawn_link(fun() -> child(Parent) end) || _ <- lists:seq(1, N)],
    io:format("Parent <~p> is starting with ~w children.~n", [Parent, N]),
    loop(Pids).

child(Parent) ->
    io:format("Child <~p> started.~n", [self()]),
    receive
        {stop} ->
            io:format("Child <~p> received 'stop' message and stopped.~n", [self()]);
        Msg ->
            io:format("Child <~p> received message: ~p~n", [self(), Msg]),
            Parent ! {self(), Msg},
            child(Parent)
    end.

send_to_child(I, Msg) ->
    Child = list_to_pid("<0." ++ integer_to_list(I) ++ ".0>"),
    io:format("Parent sending ~p to child <~p>~n", [Msg, Child]),
    Child ! Msg.

stop() ->
    io:format("Stopping parent.~n"),
    exit(stop).

loop(Pids) ->
    receive
        {Pid, Msg} ->
            io:format("Parent received ~p from child <~p>~n", [Msg, Pid]),
            loop(Pids)
    end.
