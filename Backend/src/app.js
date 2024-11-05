const express = require("express");
const app = express();
const cors = require("cors");

app.use(express.json());
app.use(cors());

const routersUsers = require("./Routers/routerUser");
const routerLogin = require('./Routers/routerLogin');
const routerGame = require("./Routers/routerGame");

app.use(routersUsers);
app.use(routerLogin);
app.use(routerGame);

module.exports = app;