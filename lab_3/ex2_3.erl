-module(ex2_3).
-export([new/0, add/2, remove/2, contains/2, size/1, to_list/1, is_subset/2]).

new() ->
    #{ }.

add(Element, Set) ->
    Map = maps:put(Element, true, Set),
    Map.

remove(Element, Set) ->
    Map = maps:remove(Element, Set),
    Map.

contains(Element, Set) ->
    maps:is_key(Element, Set).

size(Set) ->
    maps:size(Set).

to_list(Set) ->
    maps:keys(Set).

% Проверка, является ли Set1 подмножеством Set2
is_subset(Set1, Set2) ->
    L1 = ex2_3:to_list(Set1),
    L2 = ex2_3:to_list(Set2),
    contains_all_elements(L1, L2).

contains_all_elements([], _List2) ->
    true;
contains_all_elements([H|T], List2) ->
    case lists:member(H, List2) of
        true -> contains_all_elements(T, List2);
        false -> false
    end.

% c(ex2_3).
% S1 = ex2_3:new().
% S2 = ex2_3:add(1, S1).
% S3 = ex2_3:add(2, S2).
% S4 = ex2_3:add(3, S3).
% S5 = ex2_3:add(1, S4).
% ex2_3:contains(1, S5).
% ex2_3:size(S5).
% ex2_3:to_list(S5).
% S6 = ex2_3:new().
% S7 = ex2_3:add(13, S6).
% ex2_3:is_subset(S7, S5).
% ex2_3:is_subset(S3, S5).