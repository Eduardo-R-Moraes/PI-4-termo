const express = require('express');
const router = express.Router();

const controller = require('../Controllers/controllerGame')

router.get('/game', controller.getAllGame);
router.get('/game/:id', controller.getAllinfoGame);

module.exports = router;