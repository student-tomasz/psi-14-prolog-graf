% opis grafu
graph(a, b).
graph(a, c).
graph(c, e).
graph(c, f).
graph(e, g).
graph(f, g).
graph(g, h).
graph(b, d).
graph(d, h).
graph(h, i).
graph(i, m).
graph(m, n).
graph(i, j).
graph(j, k).
graph(k, l).
graph(l, n).
graph(n, o).
% graf nieskierowany
neighbour(X, Y) :- graph(X, Y).
neighbour(X, Y) :- graph(Y, X).
% lista wezlow zakazanych
avoid([f, m]).
go(Here, There) :- route(Here, There, [Here]).

% rekurencyjne poszukiwanie drogi
route(X, X, VisitedRooms) :-
	member(d, VisitedRooms),
	pisz(VisitedRooms),
	nl.
route(Room, WayOut, VisitedRooms) :-
	neighbour(Room, NextRoom),
	avoid(DangerousRooms),
	\+ member(NextRoom, DangerousRooms),
	\+ member(NextRoom, VisitedRooms),
	route(NextRoom, WayOut, [NextRoom|VisitedRooms]).

% sprawdzenie, czy element wystepuje w liscie
member(X, [X|_]).
member(X, [_|H]) :- member(X, H).

% wypisywanie w kolejnosci przechodzenia, obciaza stos
pisz([]).
pisz([H|T]) :- pisz(T), write(H), nl.
