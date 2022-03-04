#language: pt

@cad_usuario_oauth @cadastro_usuario @usuario @CT @window
Funcionalidade: Cadastro de Usuário com OAuth
Para realizar apostas em torneios esportivos
Eu, como cliente do Arena 22 com conta externa cadastrada
Desejo realizar meu cadastro de usuário utilizando integração de conta

Contexto:
Dado que estou na tela de Cadastro do Usuário
    
    @CT04 @todos_campos @sucesso
    Esquema do Cenário: Com Sucesso
    Quando realizo login oauth em minha conta <externa> através do botão <botao>
    E preencho as informações solicitadas corretamente
    E clico no botão "Criar conta"
    Então o sistema exibe a tela de bem-vindo com a mensagem "Seu Cadastro foi realizado com sucesso!"

    Exemplos:
    | externa    | botao                   |
    | "Google"   | "Continue com Google"   |
    | "Facebook" | "Continue com Facebook" |
