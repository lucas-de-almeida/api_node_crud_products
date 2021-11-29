/**
 * Arquivo: scr/routes/index.js
 * Descrição: arquivo responsavel pela chamada da(s) API's da aplicação
 * Data: 28/11/2021
 * Author: Lucas de Almeida
 */


const express = require('express');
const router = express.Router();

router.get('/api',(req,res)=>{
     res.status(200).send({
         success: 'true',
         message:'Seja bem-vindo(a) a API Node.js + PostgreSQL',
         version: '1.0.0'
     })
});

module.exports = router;