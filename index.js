const express = require('express');
const routes = require('./src/routes');
const cors = require('cors');

const app = express();


app.use(cors());
app.use(express.json());
app.use(routes);

console.log(process.env.PORT);
app.listen(process.env.PORT || 3333);