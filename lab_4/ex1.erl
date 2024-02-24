-module(ex1).
-export([ring/2, process/0]).

ring(N, M) ->
    io:format("Current: ~p~n", [self()]),
    Pids = [spawn(?MODULE, process, []) || _ <- lists:seq(0, N)],
    [First | Tail] = Pids,
    First ! {self(), 0, M, Tail, Pids},
    ok.

process() ->
    receive
        {_, _, Remain, [_], _} when Remain =:= -1 ->
            io:format("All finished ~n");
        {_, _, Remain, [Head], Pids} ->
            io:format("~p finished~n", [self()]),
            Head ! {self(), 0, Remain - 1, Pids, Pids},
            process();
        {PrevPid, Msg, Remain, [NextPid | Tail], Pids} ->
            io:format("~p received ~p from ~p~n", [self(), Msg, PrevPid]),
            NextPid ! {self(), Msg + 1, Remain, Tail, Pids},
            process();
        stop ->
            io:format("~p received stop~n", [self()])
    end.

% c(ex1).
% ex1:ring(3,2).