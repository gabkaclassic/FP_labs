-module(ex4_2).
-export([new/0, add/2, remove/2, contains/2, size/1, to_list/1]).

new() ->
    #{ }.

add(Element, Set) ->
    maps:put(Element, true, Set).

remove(Element, Set) ->
    maps:remove(Element, Set).

contains(Element, Set) ->
    maps:is_key(Element, Set).

size(Set) ->
    maps:size(Set).

to_list(Set) ->
    maps:keys(Set).

% c(ex4_2).
% Set1 = ex4_2:new().
% Set2 = ex4_2:add(1, Set1).
% Set3 = ex4_2:add(2, Set2).
% ex4_2:contains(1, Set3).
% ex4_2:size(Set3).
% ex4_2:to_list(Set3).