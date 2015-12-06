var express = require('express');
var router = express.Router();

/* GET helo page. */
router.get('/', function(req, res, next) {
  // GETのURLパラメータはreq.queryで受け取ることができる
  var p1 = req.query.p1;
  var p2 = req.query.p2;
  var msg = p1 === undefined ? '' : p1 + ',' + p2;
  var str;

  console.log(req.cokkies);

  try {
    str = req.cookies.lastdata;
  } catch(e) {
    console.log(e);
  }

  res.render('helo', {
    title: 'Helo Page',
    msg: msg,
    input: '',
    cokkie: "last:" + str
  });
});

router.post('/', function(req, res, next) {
  // POSTされた値はreq.bodyで受け取ることができる
  var str = req.body['input1'] === undefined ? '' : req.body['input1'];
  console.log(str);
  res.cookie("lastdata", str);
  res.render('helo', {
    title: 'Helo Page',
    msg: 'you typed' + str,
    cokkie: str,
    input: str
  });
});


module.exports = router;
