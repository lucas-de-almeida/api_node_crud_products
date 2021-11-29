/**
 * Arquivo: app.js
 * Descrição: arquivo responsavel por toda comunicação entre server e o restante da aplicação
 * Data: 28/11/2021
 * Author: Lucas de Almeida
 */

const express =require('express');
const cors = require('cors');

const app = express();


//Rotas da API

const index = require('./routes/index');
const productRoute = require('./routes/product.routes');

app.use(express.urlencoded({
    extended: true
}));
app.use(express.json());
app.use(express.json({type: 'aplication/vdn.api+json'}));
app.use(cors());

app.use(index);
app.use('/api/',productRoute);

module.exports = app;