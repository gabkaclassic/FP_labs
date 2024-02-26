-module(ex1).
-export([split/2]).
-export([example/0]).
-compile([tree]).
-record(bin_tree, {value, left, right}).

% Функция для разделения дерева
split(Tree, X) ->
    % В случае пустого дерева возвращаем два пустых дерева
    case Tree of
        nil -> {nil, nil};
        #bin_tree{value = Value, left = Left, right = Right} ->
            % Если значение в узле меньше X, рекурсивно вызываем split для правого поддерева
            if Value < X ->
                {TreeLT, TreeGT} = split(Right, X),
                {#bin_tree{value = Value, left = Left, right = TreeLT}, TreeGT};
            % Если значение в узле больше либо равно X, рекурсивно вызываем split для левого поддерева
            true ->
                {TreeLT, TreeGT} = split(Left, X),
                {TreeLT, #bin_tree{value = Value, left = TreeGT, right = Right}}
            end
    end.

build_tree() ->
    Node1 = #bin_tree{value = 5, left = nil, right = nil},
    Node2 = #bin_tree{value = 3, left = nil, right = nil},
    Node3 = #bin_tree{value = 8, left = nil, right = nil},
    Node4 = #bin_tree{value = 1, left = nil, right = nil},
    Node5 = #bin_tree{value = 4, left = nil, right = nil},
    Node6 = #bin_tree{value = 7, left = nil, right = nil},
    Node7 = #bin_tree{value = 9, left = nil, right = nil},
    Tree1 = #bin_tree{value = 2, left = Node1, right = Node2},
    Tree2 = #bin_tree{value = 5, left = Tree1, right = Node3},
    Tree3 = #bin_tree{value = 4, left = Node4, right = Node5},
    Tree4 = #bin_tree{value = 8, left = Node6, right = Node7},
    Tree5 = #bin_tree{value = 7, left = Tree3, right = Tree4},
    Tree6 = #bin_tree{value = 6, left = Tree2, right = Tree5},
    #bin_tree{value = 3, left = nil, right = Tree6}.

example() ->
    Tree = build_tree(),
    Element = 5,
    {TreeLT, TreeGT} = ex1:split(Tree, Element),
    io:format("Less than ~p: ~p~n", [Element, TreeLT]),
    io:format("More than ~p: ~p~n", [Element, TreeGT]).

% c(ex1).
% ex1:example().