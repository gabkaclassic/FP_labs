-module(ex4_1).
-export([new/0, add/2, remove/2, contains/2, size/1, to_list/1]).

new() ->
    [].

add(Element, Set) ->
    lists:sort(lists:usort(Set ++ [Element])).

remove(Element, Set) ->
    lists:delete(Element, Set).

contains(Element, Set) ->
    lists:member(Element, Set).

size(Set) ->
    length(Set).

to_list(Set) ->
    Set.

% c(ex4_1).
% Set1 = ex4_1:new().
% Set2 = ex4_1:add(1, Set1).
% Set3 = ex4_1:add(2, Set2).
% ex4_1:contains(1, Set3).
% ex4_1:size(Set3).
% ex4_1:to_list(Set3).