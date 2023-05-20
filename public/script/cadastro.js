function cadastrar() {

    //Recupere o valor da nova input pelo nome do id
    // Agora vá para o método fetch logo abaixo
    var nomeVar = input_nome.value;
    var emailVar = input_email.value;
    var senhaVar = input_senha.value;
    var confirmacaoSenhaVar = input_confirma_senha.value;
    var pesoVar = Number(input_peso.value);

     if(senhaVar != confirmacaoSenhaVar){
        alert( "senha e confirmação de senha diferentes ")
    } else if (emailVar.indexOf('@') == -1 || emailVar.indexOf('.') == -1) {
        alert ("E-mail sem '@' ou '.' ")
    }

    if (nomeVar == "" || emailVar == "" || senhaVar == "" || pesoVar == "") {
        console.log("if1")
        console.log("nome" + nomeVar + "\n email " + emailVar + "\n senha " + senhaVar + "\n peso " + pesoVar)
    }
    else {
            console.log("nome" + nomeVar + "\n email " + emailVar + "\n senha " + senhaVar + "\n peso " + pesoVar)
        }

    // Enviando o valor da nova input
    fetch("/usuarios/cadastrar", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            // crie um atributo que recebe o valor recuperado aqui
            // Agora vá para o arquivo routes/usuario.js
            nomeServer: nomeVar,
            emailServer: emailVar,
            senhaServer: senhaVar,
            pesoSever: pesoVar
        })
    }).then(function (resposta) {

        console.log("resposta: ", resposta);

        if (resposta.ok) {
 
            window.location = "./login.html";
        }
    }).catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
    });

    return false;
}
