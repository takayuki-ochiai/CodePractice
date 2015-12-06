var express = require('express');
var router = express.Router();

/* GET event page. */
// コントローラー扱い？
router.get('/', function(req, res, next) {
  res.render('if', { title: 'class付加の練習' });
});

module.exports = router;
