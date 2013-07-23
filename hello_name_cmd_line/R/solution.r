f <- file("stdin")
open(f)
name <- readLines(f, n=1)
cat(paste("Hello, ", name, "\n", sep=""))
