/**
 * Arquivo: server.js
 * Descrição: arquivo responsavel por toda configuração e execução da aplicação
 * Data: 28/11/2021
 * Author: Lucas de Almeida
 */

const app = require('./src/app');

const port =process.env.port || 3000;

app.listen(port,()=>{
    console.log('Aplicação executando na porta ', port);
})

