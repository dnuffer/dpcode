import sys
from socket import *

sock = socket(AF_INET, SOCK_DGRAM)
sock.bind(("localhost", 9999))
print "Ready"
sys.stdout.flush()
data, addr = sock.recvfrom(1024)
print data
