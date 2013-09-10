var dgram = require('dgram');
var sock = dgram.createSocket('udp4');
var message = new Buffer("Hello, " + process.argv[2]);
sock.send(message, 0, message.length, 9999, "localhost", function(err, bytes) {
  sock.close();
});
