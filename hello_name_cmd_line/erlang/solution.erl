-module(solution).
-export([main/0]).

main() -> io:fwrite("Hello, ~s~n", [io:get_line("")]).
