var express = require('express');
var router = express.Router();
var userService = require('../service/user-service');

router.get('/', userService.getAllUsers);
router.get('/:dni', userService.getOneUser);
router.post('/login', userService.login);
router.post('/signup', userService.signUp);


module.exports = router;
