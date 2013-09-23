-module(solution).
-compile([export_all]).
-include_lib("eunit/include/eunit.hrl").

sqrt(X, E) ->
    sqrt(X, mean(X, 1), X, E).

%% Base case: our current and previous guess are virtually
%% indistinguishable
sqrt(_X, Guess, Previous, E) when abs(Guess - Previous) < E ->
    Guess;

%% Otherwise, try again by dividing X by Guess and averaging
%% with Guess
sqrt(X, Guess, _Previous, E) ->
    sqrt(X,
         mean(Guess, (X / Guess)),
         Guess,
			E).

mean(X, Y) ->
    (X + Y) / 2.0.

main() -> 
	[ io:fwrite("~f~n", [sqrt(2, 0.000001)]),
		?assert((1.413 =< sqrt(2, 0.000001)) and (sqrt(2, 0.000001) =< 1.415))
	].

