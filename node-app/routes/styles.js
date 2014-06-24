/**
 * Created by kono on 2014/06/23.
 */
var express = require('express');
var request = require('request');
var router = express.Router();

router.get('/:id', function(req, res) {
    var url = decodeURIComponent(req.params.id);
    req.pipe(request(url)).pipe(res);
});

module.exports = router;
