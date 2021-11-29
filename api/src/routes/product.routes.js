/**
 * Arquivo: scr/routes/product.routes.js
 * Descrição: arquivo responsavel pelas rotas da API relacionada a classe 'Product'
 * Data: 28/11/2021
 * Author: Lucas de Almeida
 */


const router = require('express-promise-router')();
const productController = require('../controllers/product.controllers');

//==> Definindo as rotas do CRUD - 'Product'

//==> Rota responsavel por criar um novo 'Product':(POST): localhost:3000/api/products
router.post('/products', productController.createProduct);

module.exports = router;
