
sibling(anna, lucy)
% sibling(anna, lucy)
%   parent(Z, anna), parent(Z, lucy), anna \= lucy
%     parent(john, anna), parent(john, lucy), anna \= lucy
%       true
%   true

ancestor(john, mike)
% ancestor(john, mike)
%   parent(john, mike)
%     true

sibling(john, john)
% sibling(john, john)
%   parent(Z, john), parent(Z, john), john \= john
%     false
%   true

ancestor(anna, mike)
% ancestor(anna, mike)
%   parent(anna, mike)
%     true

ancestor(lucy, mike)
% ancestor(lucy, mike)
%   parent(lucy, mike)
%     true
