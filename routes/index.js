var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  const x_forwarded_host = req.headers['x-forwarded-host'];
  let hostName = x_forwarded_host ? x_forwarded_host : req.headers.host;
  if (hostName.includes(':')) {
    hostName = hostName.split(':')[0];
  }

  let title = `Web (${hostName}) `;

  res.render('index', { title: title });
});

module.exports = router;
