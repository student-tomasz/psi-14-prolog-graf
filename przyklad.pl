% opis grafu
gallery(entry, monsters).
gallery(entry, fountain).
gallery(fountain, hell).
gallery(fountain, food).
gallery(exit, gold_treasure).
gallery(fountain, mermaid).
gallery(robbers, gold_treasure).
gallery(fountain, robbers).
gallery(food, gold_treasure).
gallery(mermaid, exit).
gallery(monsters, gold_treasure).
% graf nieskierowany
neighborroom(X, Y) :- gallery(X, Y).
neighborroom(X, Y) :- gallery(Y, X).
% lista wezlow zakazanych
avoid([monsters, robbers]).
go(Here, There) :- route(Here, There, [Here]).

% rekurencyjne poszukiwanie drogi
route(exit, exit, VisitedRooms) :-
	member(gold_treasure, VisitedRooms), write(VisitedRooms), nl.
route(Room, WayOut, VisitedRooms) :-
	neighborroom(Room, NextRoom),
	avoid(DangerousRooms),
	\+ member(NextRoom, DangerousRooms),
	\+ member(NextRoom, VisitedRooms),
	route(NextRoom, WayOut, [NextRoom|VisitedRooms]).

% sprawdzenie, czy element wystepuje w licie
member(X, [X|_]).
member(X, [_|H]) :- member(X, H).
