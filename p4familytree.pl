% By Shivali Choudhary
male(siddharth).
male(surendra).
male(narendra).


female(jyoti).
female(shivali).
female(shanti).
female(raunak).
female(nirvika).


parent_of(surendra,narendra).
parent_of(shanti,narendra).
parent_of(narendra,siddharth).
parent_of(narendra,shivali).
parent_of(jyoti,siddharth).
parent_of(jyoti,shivali).
parent_of(siddharth,nirvika).
parent_of(raunak,nirvika).



father(X,Y) :- male(X),parent_of(X,Y).

mother(X,Y) :- female(X),parent_of(X,Y).

son(X,Y) :- male(X),parent_of(Y,X).

daughter(X,Y) :- female(X),parent_of(Y,X).
grandparent(X, Y) :- parent_of(X, Somebody), parent_of(Somebody, Y).

sibling(X, Y) :- parent_of(Somebody, X), parent_of(Somebody,Y), X \= Y.

grandfather(X,Y) :- male(X),parent_of(X,Somebody),parent_of(Somebody,Y).
aunt(X,Y) :- female(X),sister(X,Mom),mother(Mom,Y).
aunt(X,Y) :- female(X),sister(X,Dad),father(Dad,Y).
sister(X,Y) :- female(X),parent_of(Par,X),parent_of(Par,Y), X \= Y.
uncle(X,Y) :- brother(X,Par),parent(Par,Y).
cousin(X,Y) :- uncle(Unc , X),father(Unc,Y).
ancestor(X,Y) :- parent_of(X,Y).
ancestor(X,Y) :- parent_of(X,Somebody),ancestor(Somebody,Y).
brother(X,Y) :-  male(X),parent_of(Somebody,X),parent_of(Somebody,Y), X \= Y.
