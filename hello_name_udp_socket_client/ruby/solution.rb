require 'socket'

sock = UDPSocket.new
sock.connect("localhost", 9999)
sock.send("Hello, #{ARGV[0]}", 0)
