%% Модуль ex4_ring_sup.erl
-module(ex4_ring_sup).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Children = [
        {ex4_ring, {ex4_ring, start_link, []}, permanent, 5000, worker, [ex4_ring]}
    ],
    RestartStrategy = {one_for_one, 5, 10},
    {ok, {RestartStrategy, Children}}.

