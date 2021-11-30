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


//==> Rota responsavel por selecionar todos os  'Product':(GET): localhost:3000/api/products
router.get('/products', productController.listAllProducts);


//==> Rota responsavel por selecionar  'Product' PELO 'Id':(GET): localhost:3000/api/products/:id
router.get('/products/:id', productController.findProductById);

//==> Rota responsavel por atualizar   'Product' PELO 'Id':(PUT): localhost:3000/api/products/:id
router.put('/products/:id', productController.updateProductById);

//==> Rota responsavel por deletar  'Product' PELO 'Id':(DELETE): localhost:3000/api/products/:id
router.delete('/products/:id', productController.deleteProductById);


module.exports = router;
