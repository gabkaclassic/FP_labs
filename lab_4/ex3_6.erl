-module(ex3_6).
-export([par_filter/3]).

par_filter(F, List, Options) ->
    SublistSize = proplists:get_value(sublist_size, Options, 1),
    Processes = proplists:get_value(processes, Options, length(List)),
    Sublists = split_list(List, SublistSize),
    Parent = self(),
    Pids = [spawn_link(fun() -> filter_process(F, Sublist, Parent) end) || Sublist <- Sublists],
    Results = [receive {Pid, Result} -> Result end || Pid <- Pids],
    lists:flatten(Results).

filter_process(F, Sublist, Parent) ->
    Filtered = lists:filter(F, Sublist),
    Parent ! {self(), Filtered}.

split_list(List, SublistSize) when length(List) > SublistSize ->
    [lists:sublist(List, 1, SublistSize) | split_list(lists:sublist(List, SublistSize + 1, length(List)), SublistSize)];
split_list(List, _) ->
    [List].

% c(ex3_6).
% ex3_6:par_filter(fun(X) -> X < 0  end, [1, 2, -3, 0, 1, 100, -9, 5], [{sublist_size, 4
% }, {processes, 4}, {timeout, infinity}]).    