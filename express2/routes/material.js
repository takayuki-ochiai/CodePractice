var express = require('express');
var router = express.Router();

/* GET event page. */
router.get('/', function(req, res, next) {
  res.render('material', { title: 'マテリアルデザインを呼んでみる' });
});

module.exports = router;
