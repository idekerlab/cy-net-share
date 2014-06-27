/**
 *
 * Created by kono on 2014/06/26.
 */

'use strict';

var express = require('express');
var request = require('request');
var router = express.Router();

var GIST_API_URL = "https://api.github.com/gists/";

router.get('/:gistId', function(req, res) {
    console.log("Target GIST ID: " + req.params.gistId);
    var url = GIST_API_URL + req.params.gistId;
    req.pipe(request(url)).pipe(res);
});

module.exports = router;
