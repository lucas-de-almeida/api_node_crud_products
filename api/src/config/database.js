/**
 * Arquivo: config/database.js
 * Descrição: arquivo responsavel pelas 'connectionsStrings' da aplicação:PostgreSQL.
 * Data: 29/11/2021
 * Author: Lucas de Almeida
 */

const {Pool} = require('pg');
const dotenv = require('dotenv');

dotenv.config();

//==> Conexão com a base de dados 

const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});

pool.on('connect',()=>{
    console.log('Base de dados conectada com sucesso!');
});

module.exports= {
    query: (text,params)=> pool.query(text,params)
};