/**
 * Created by kono on 2014/06/24.
 */
var express = require('express');
var request = require('request');
var router = express.Router();

router.get('/:id', function(req, res) {
    var url = decodeURIComponent(req.params.id);
    var styleUrl = req.query.style;
    var styleName = req.query.name;
    console.log('Style LOC = ' + styleUrl);
    console.log('Style NAME = ' + styleName);
    res.render('static', {
        styleLocation: styleUrl,
        styleName: styleName,
        networkLocation: url
    });
});

module.exports = router;
