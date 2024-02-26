-module(ex2_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Children = [{Worker, {ex2, start, []}, permanent, 5000, worker, [ex2]} || Worker <- lists:seq(1, 3)],
    {ok, {{one_for_all, 5, 10}, Children}}.
