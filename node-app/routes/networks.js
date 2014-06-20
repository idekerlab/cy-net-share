var express = require('express');
var router = express.Router();

router.get('/networks/:id', function(req, res) {
	res.send('hello ' + req.params.id + '!');
});

module.exports = router;