#language: pt

@teste_conexao
Funcionalidade: Teste de Conexão com BD

    Cenário: Sucesso
    Dado que eu esteja conectado no BD
    Quando eu realizo um select no banco
    Então eu vejo o resultado do meu select