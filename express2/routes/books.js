var express = require('express');
var router = express.Router();

/* GET book page. */
router.get('/', function(req, res, next) {
  res.render('books', { title: 'AngularJS books' });
});

module.exports = router;
