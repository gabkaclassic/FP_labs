-module(ex4_ring).
-export([start_link/0, init/1, ring/2]).
-behaviour(gen_server).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    {ok, []}.

ring(N, M) ->
    io:format("Starting ring with ~p children~n", [N]),
    Pids = [spawn_link(fun() -> process() end) || _ <- lists:seq(1, N)],
    First = hd(Pids),
    First ! {self(), 0, M, tl(Pids), Pids},
    ok.

process() ->
    receive
        {_, _, 0, [], _} ->
            io:format("All finished~n"),
            ok;
        {_, _, 0, [Head], Pids} ->
            io:format("~p finished~n", [self()]),
            Head ! {self(), 0, -1, Pids, Pids},
            process();
        {PrevPid, Msg, Remain, [NextPid | Tail], Pids} ->
            io:format("~p received ~p from ~p~n", [self(), Msg, PrevPid]),
            NextPid ! {self(), Msg + 1, Remain - 1, Tail, Pids},
            process();
        stop ->
            io:format("~p received stop~n", [self()])
    end.

% c(ex4_app).
% c(ex4_ring).
% c(ex4_ring_sup).
% application:start(ex4_app).