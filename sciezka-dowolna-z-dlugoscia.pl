% opis grafu
graph(a, b, 1).
graph(a, c, 2).
graph(c, e, 4).
graph(c, f, 6).
graph(e, g, 7).
graph(f, g, 8).
graph(g, h, 2).
graph(b, d, 3).
graph(d, h, 5).
graph(h, i, 8).
graph(i, m, 7).
graph(m, n, 109).
graph(i, j, 11).
graph(j, k, 9).
graph(k, l, 13).
graph(l, n, 7).
graph(n, o, 6).
% graf nieskierowany
neighbour(X, Y, Length) :- graph(X, Y, Length).
neighbour(X, Y, Length) :- graph(Y, X, Length).
% lista wezlow zakazanych
avoid([f, m]).
go(Here, There) :- route(Here, There, [Here], 0).

% rekurencyjne poszukiwanie drogi
route(X, X, VisitedRooms, Length) :-
	member(d, VisitedRooms),
	pisz(VisitedRooms, Length),
	nl.
route(Room, WayOut, VisitedRooms, RouteLength) :-
	neighbour(Room, NextRoom, Length),
	avoid(DangerousRooms),
	\+ member(NextRoom, DangerousRooms),
	\+ member(NextRoom, VisitedRooms),
    NewLength is RouteLength + Length,
	route(NextRoom, WayOut, [NextRoom|VisitedRooms], NewLength).

% sprawdzenie, czy element wystepuje w liscie
member(X, [X|_]).
member(X, [_|H]) :- member(X, H).

% wypisywanie w kolejnosci przechodzenia, obciaza stos
pisz([], Length) :- write(Length), nl.
pisz([H|T], Length) :- pisz(T, Length), write(H), nl.
