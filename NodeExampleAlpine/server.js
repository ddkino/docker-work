'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  console.log('Received request for URL: ' + req.url);
  res.send('Hello world  2\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);