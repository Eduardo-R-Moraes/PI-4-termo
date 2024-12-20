const express = require('express');
const router = express.Router();
const controllers = require('../Controllers/controllerLogin');
const middlewares = require('../Middlewares/middlewares');

router.post('/login', middlewares.validarLogin, controllers.login);

module.exports = router;