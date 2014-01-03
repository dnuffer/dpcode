#!/usr/bin/env Rscript
suppressPackageStartupMessages(library("optparse"))

option_list <- list( 
    make_option(c("-n", "--name"), help = "Specify name")
    )
                                        
parser <- OptionParser(option_list=option_list)
opt <- parse_args(parser, print_help_and_exit=FALSE)

if (opt[["help"]]) {
	 print_help(parser)
	 quit(status=0)
}

if (opt$name != "") {
	cat(paste("Hello, ", opt$name, "\n", sep=""))
} else {
	cat("Must specify name")
	quit(status=1)
}
