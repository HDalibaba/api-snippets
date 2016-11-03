const http = require('http');
const express = require('express');
const twilio = require('twilio');

const app = express();

app.post('/sms', function(req, res) {
  const twiml = new twilio.TwimlResponse();

  twiml.message(function() {
    this.body('The Robots are coming! Head for the hills!');
    this.media('https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg');
  });

  res.writeHead(200, {'Content-Type': 'text/xml'});
  res.end(twiml.toString());
});

http.createServer(app).listen(1337, function() {
    console.log('Express server listening on port 1337');
});
