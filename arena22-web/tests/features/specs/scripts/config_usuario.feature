#language: pt

@script_usuario @script @window
Funcionalidade: Configuração de Usuários de Teste

    @script_cad_usuario
    Esquema do Cenário: Cadastro de Usuários
    Para configuração dos logins do ambiente de testes
    Onde a base de dados foi atualizada e não existem os usuários teste
    É realizado o cadastro desses usuários

        Dado que eu esteja na tela de Cadastro de Usuário
        Quando faço cadastro do <usuario> de teste
        Então vejo que o usuário foi cadastrado com sucesso

        Exemplos:
            | usuario       |
            | "user_test_1" |
            | "user_test_2" |
            #| "user_test_3" |
            | "user_test_4" |
    