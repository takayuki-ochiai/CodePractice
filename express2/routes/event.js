var express = require('express');
var router = express.Router();

/* GET event page. */
// コントローラー扱い？
router.get('/', function(req, res, next) {
  res.render('event', { title: 'eventの練習' });
});

module.exports = router;
