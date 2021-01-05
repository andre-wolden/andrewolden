const express = require('express')
const app = express()
const port = 3019

var os = require('os');
var networkInterfaces = os.networkInterfaces();
console.log(networkInterfaces['en0'][1]);

app.use(express.static('dist'))

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

