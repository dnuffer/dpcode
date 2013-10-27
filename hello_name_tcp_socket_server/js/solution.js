var net = require('net');
var server = net.createServer(function(c) { //'connection' listener
  //console.log('server connected');
  c.on('end', function() {
    //console.log('server disconnected');
  });
  c.on('data', function(data) {
    c.write('Hello, ' + data);
    server.close();
    c.end();
  });
});
server.listen(9999, function() { //'listening' listener
  console.log('Ready');
});
