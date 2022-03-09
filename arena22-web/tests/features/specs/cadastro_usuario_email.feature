#language: pt

@cad_usuario_email @cadastro_usuario @usuario @CT @window
Funcionalidade: Cadastro de Usuário
Para realizar apostas em torneios esportivos
Eu como cliente do Arena 22
Desejo realizar meu cadastro de usuário
    
    @CT01 @todos_campos @sucesso
    Cenário: Todos os Campos Preenchidos
    Dado que estou na tela de Cadastro do Usuário
    Quando preencho todos os campos do formulário
    E clico no botão "Criar conta"
    Então o sistema exibe a tela de bem-vindo com meu apelido de usuário

    @CT02 @campos_obrigatorios @sucesso
    Cenário: Apenas Campos Obrigatórios Preenchidos
    Dado que estou na tela de Cadastro do Usuário
    Quando preencho apenas os campos obrigatórios do formulário
    E clico no botão "Criar conta"
    Então o sistema exibe a tela de bem-vindo com meu apelido de usuário

    @CT03 @por_torneio @sucesso
    Cenário: Com Direcionamento para a Tela de Palpites do Torneio
    Dado que tento Comprar uma Participação em um Torneio
    E acesso a tela de Cadastro do Usuário a partir do Modal de Login aberto
    Quando preencho todos os campos do formulário
    E clico no botão "Criar conta"
    Então o sistema exibe a tela de bem-vindo com a mensagem "Seu Cadastro foi realizado com sucesso!"
    E ao confirmar sou direcionado para a Tela de Palpites do Torneio