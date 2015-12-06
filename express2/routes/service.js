var express = require('express');
var router = express.Router();

/* GET book page. */
router.get('/', function(req, res, next) {
  res.render('service', { title: 'AngularJS books of service' });
});

module.exports = router;
