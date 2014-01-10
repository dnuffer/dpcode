# Unfortunately there's a race condition here because R doesn't seem to have a way to listen() and then
# accept(), it all happens in socketConnection(). The Ready should be printed after listen() and before
# accept()
cat("Ready\n")
con1 <- socketConnection(port = 9999, server = TRUE)
name = readLines(con1)
writeLines(paste("Hello, ", name, sep=""), con1)
close(con1)
