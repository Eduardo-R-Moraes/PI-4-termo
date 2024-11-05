const express = require('express');
const router = express.Router();

const controller = require('../Controllers/controllerUser')
const middlewares = require('../Middlewares/middlewares')

router.get('/user', controller.getAll);
router.get('/user/:id', controller.getUserById);
router.post('/user', middlewares.validateEmail, middlewares.validatePassword, controller.createUser);
router.delete('/user/:id')
//router.get('/user/me', controller.getUserById);

module.exports = router;