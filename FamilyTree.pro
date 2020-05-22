% By Shivali Choudhary
% family1
family([shanti,surendra],[[vj],[virendra,narendra]]).
family([jyoti,narendra],[[shivali],[siddharth]]).
family([raunak,siddharth],[[nirvika],[]]).


% X is the father of Y
father_of(X,Y) :- family([_,X],[Ds,Ss]), (member(Y,Ds); member(Y,Ss)).

% X is the mother of Y
mother_of(X,Y) :- family([X,_],[Ds,Ss]), (member(Y,Ds); member(Y,Ss)).

% X is the parent of Y
parent_of(X,Y) :- father_of(X,Y); mother_of(X,Y).

% X is male
male(X) :- family([_,X],_).
male(X) :- family(_,[_,Ss]), member(X,Ss).

% X is female
female(X) :- family([X,_],_).
female(X) :- family(_,[Ds,_]), member(X,Ds).

% X is the son of Y
son_of(X,Y) :- parent_of(Y,X), male(X).

% X is the daughter of Y
daughter_of(X,Y) :- parent_of(Y,X), female(X).

% X is the sibling of Y
sibling_of(X,Y) :- parent_of(Parent,X), parent_of(Parent,Y), X\==Y.

% X is the brother of Y
brother_of(X,Y) :- sibling_of(X,Y), male(X).

% X is the sister of Y
sister_of(X,Y) :- sibling_of(X,Y), female(X).

% X is the grandparent of Y
grandparent_of(X,Y) :- parent_of(X,Parent), parent_of(Parent,Y).

% X is the ancestor of Y
ancestor_of(X,Y) :- parent_of(X,Y).
ancestor_of(X,Y) :- parent_of(X,Parent), ancestor_of(Parent,Y).

% S is the oldest son of P
oldest_son(S,P) :- parent_of(P,S), family(_,[_,[S|_]]).

% D is the oldest daughter of P
oldest_daughter(D,P) :- parent_of(P,D), family(_,[[D|_],_]).
