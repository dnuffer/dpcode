import sys
from socket import *

message = "Hello, %s" % sys.argv[1]
s = socket(AF_INET, SOCK_DGRAM)
s.sendto(message, ("localhost", 9999))
