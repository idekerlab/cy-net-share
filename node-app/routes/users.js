var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  res.render('index', { title: 'Express' });
});
// router.get('/users', function(req, res) {
// 	console.log("@@@@@@@@@@@@@@@@@");
//   res.send('respond with a resource');
// });

module.exports = router;
