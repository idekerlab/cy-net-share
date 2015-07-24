var express = require('express');
var request = require('request');
var fs = require('fs');
var readline = require('readline'); 

var router = express.Router();

var GOOGLE_SHORTENER = 'https://www.googleapis.com/urlshortener/v1/url?key=';

var rd = readline.createInterface({
    input: fs.createReadStream('api_key.txt'),
    output: process.stdout,
    terminal: false
});

var api_key = null;

rd.on('line', function(line) {
	if(line != '') {
		api_key = line;
		console.log('Successfully loaded API key.');
		return;
	}
});


router.route('/').post(function(req, res, next) {
	var data = req.body;
    console.log('Original URL1 = ' + data.original);
    var url = data.original

    var apiUrl = GOOGLE_SHORTENER + api_key;

    var original = {
    	longUrl: url 
    };

    var params = {
  		uri: apiUrl,
  		method: 'POST',
  		json: {
    		"longUrl": url
  		}
	};

	request(params, function (error, response, body) {
		if (!error && response.statusCode == 200) {
			res.send(body.id);
	  	}
	});

});

module.exports = router;