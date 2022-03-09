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
    Quando realizo login oauth em minha <conta_externa>
    E preencho todas as informações restantes corretamente
    E clico no botão "Criar conta"
    Então o sistema exibe a tela de bem-vindo com o apelido do usuário

    Exemplos:
    | conta_externa |
    | "Google"      |
    | "Facebook"    |
