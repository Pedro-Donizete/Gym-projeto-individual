var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, senha, peso) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha, peso);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO usuario (nome, email, senha, inicialPesoKG) VALUES ('${nome}', '${email}', '${senha}', ${peso});
        
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
function insertpesoinicial(email, senha, peso){
        var instrução2 = `
        INSERT INTO Controle_de_peso (inicialPesoKG, fkUsuario) VALUES 
        (${peso}, (select idUsuario from usuario where email = '${email}' and senha = '${senha}'));
        `
        return database.executar(instrução2);
    } 
function getpeso(id) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", id)
    var instrucao = `
    select * from Usuario join Controle_de_Peso on 
	fkUsuario = idUsuario where idUsuario = ${id};
        `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
function insert(peso, mes, id){
    var instrucao = `

    INSERT INTO Controle_de_Peso(pesoPmes, tempoMes, fkUsuario) VALUES
    (${peso}, '${mes}', ${id})


    `;
    console.log("executando insert no banco")

    return database.executar(instrucao)
}

module.exports = {
    entrar,
    cadastrar,
    listar,
    getpeso,
    insertpesoinicial,
    insert,
};