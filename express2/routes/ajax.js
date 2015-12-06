var express = require('express');
var router = express.Router();

/* GET helo page. */
router.get('/', function(req, res, next) {
  // GETのURLパラメータはreq.queryで受け取ることができる
  var p1 = req.query.p1;
  var p2 = req.query.p2;
  var msg = p1 === undefined ? '' : p1 + ',' + p2;
  // レンダリングするejsを入力
  res.render('ajax', {
    title: 'Helo Ajax',
    msg: msg,
    input: ''
  });
});

router.post('/', function(req, res, next) {
  var str = req.query.input1;
  res.json({msg: str});
});


module.exports = router;
