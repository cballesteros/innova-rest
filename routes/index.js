var express = require('express');
var router = express.Router();
var pool = require('../service/connection');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'innOVA' });
});

router.get('/db', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM test_table');
    const results = { 'results': (result) ? result.rows : null};
    res.status(200).json({data: results});
    client.release();
  } catch (err) {
    console.error(err);
    res.send("Error " + err);
  }
})

module.exports = router;
