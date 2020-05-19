var express = require('express');
var router = express.Router();
var ovasService = require('../service/ovas-service');

router.get('/', ovasService.getAllOvas);
router.post('/register', ovasService.register);

module.exports = router;