%% Модуль ex4_app.erl
-module(ex4_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_StartType, _Args) ->
    io:format("Starting ex4 application~n"),
    {ok, Pid} = ex4_ring_sup:start_link(),
    {ok, Pid}.

stop(_State) ->
    io:format("Stopping ex4 application~n"),
    ok.

