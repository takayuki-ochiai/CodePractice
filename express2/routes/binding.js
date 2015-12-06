var express = require('express');
var router = express.Router();

/* GET home page. */
// コントローラー扱い？
router.get('/', function(req, res, next) {
  res.render('binding', { title: '双方向バインディングのサンプル' });
});

module.exports = router;
