/**
 * Arquivo: scr/controllers/product.controllers.js
 * Descrição: arquivo responsavel pela logica do CRUD da API 'Product'
 * Data: 28/11/2021
 * Author: Lucas de Almeida
 */


const db = require('../config/database');

//===> Metodo responsavel por criar um novo produto

exports.createProduct = async(req,res)=>{
const {product_name, quantity,product_description} = req.body;
const {rows}=await db.query(
    'INSERT INTO products (product_name,quantity,product_description) VALUES ($1,$2,$3)',
    [product_name,quantity,product_description]
);

res.status(201).send({
    message: 'Product added succesfully !',
    body: {
        product: {product_name, quantity, product_description}
    },
});
}

//==>metodo responsavel por selecionar todo os 'Products'

exports.listAllProducts = async (req, res)=>{
    const response = await db.query('SELECT * FROM products');
    res.status(200).send(response.rows);
};


//==>metodo responsavel por selecionar um 'Products' pelo Id
exports.findProductById= async(req,res)=>{
    const productId=parseInt(req.params.id);
    const response =  await db.query('SELECT * FROM products WHERE productId = $1',[productId]);
    res.status(200).send(response.rows);
}

//==>metodo responsavel por atualizar um 'Products' pelo Id

exports.updateProductById = async (req,res) => {
    const productId= parseInt(req.params.id);
    const{product_name,quantity,product_description}=req.body;

    const response = await db.query(
        'UPDATE products SET product_name = $1 ,quantity = $2 , product_description = $3 WHERE productId = $4',
        [product_name,quantity,product_description,productId]
    );
res.status(200).send({message: 'Product Updated Successfully!'});
};


exports.deleteProductById = async (req,res)=>{
    const productId=parseInt(req.params.id);
    await db.query('DELETE FROM products WHERE productId = $1',[productId]);

    res.status(200).send({message: 'Product deleted successfully!', productId});
};