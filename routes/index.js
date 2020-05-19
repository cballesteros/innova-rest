var express = require('express');
var router = express.Router();
var dbInstance = require('../service/connection');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'innOVA' });
});

router.get('/db', (req, res, next) {
  dbInstance.any('SELECT * FROM public.\"test_table\"')
      .then(data => {
          res.status(200)
              .json({
                  status: 'success',
                  data: data,
                  message: 'Retrieved all tests'
              });
          })
      .catch(error => {
          return next(error);
      });
})

module.exports = router;
