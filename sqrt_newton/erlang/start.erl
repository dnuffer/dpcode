-module(solution).
-compile([export_all]).
-include_lib("eunit/include/eunit.hrl").


main() -> 
	[ io:fwrite("~f~n", [sqrt(2, 0.000001)]),
		?assert((1.413 =< sqrt(2, 0.000001)) and (sqrt(2, 0.000001) =< 1.415))
	].


