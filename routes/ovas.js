var express = require('express');
var router = express.Router();
var ovasService = require('../service/ovas-service');

router.get('/', ovasService.getAllOvas);
router.get('/search/:query', ovasService.searchOVA);
router.post('/register', ovasService.register);

module.exports = router;