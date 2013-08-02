if nargin == 1 && strcmp(argv(){1}, "--help")
	printf("--name NAME set name\n");
	printf("--help print help\n");
	exit(0);
end

if nargin != 2 || (~strcmp(argv(){1}, "--name") && ~strcmp(argv(){1}, "-n"))
	fprintf(stderr(), "--name NAME set name\n");
	fprintf(stderr(), "--help print help\n");
	exit(1);
end

name = argv(){2};
printf("Hello, %s\n", name);
