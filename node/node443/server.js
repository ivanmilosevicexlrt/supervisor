const https = require('https');
const fs = require('fs');

const options = {
  key: fs.readFileSync('key.pem'),
  cert: fs.readFileSync('cert.pem')
};

var os = require("os");
var hostname = os.hostname();

https.createServer(options, function (req, res) {
  res.writeHead(200);
  res.end("hello from: " + hostname + "\n");
}).listen(443);