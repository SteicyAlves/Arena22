#language: pt

@script_torneio @script @login 
Funcionalidade: Configuração de Torneio

    @script_cad_torneio
    Esquema do Cenário: Liberação de Torneio
    Para criação de massa de testes
    Onde se faz necessária a liberação de vários torneios
    É realizado o cadastro e liberação de torneios

        Dado que estou na tela de Cadastro de Torneio de um <clube>
        Quando faço a liberação de um <torneio> de <tipo_moeda>, <tipo_premiacao>, <valor_garantido> e <limite_participacao>
        Então vejo que o torneio foi cadastrado com sucesso
        Exemplos:
            | clube | torneio             | tipo_moeda | tipo_premiacao    | valor_garantido | limite_participacao |
            | 10551 | "tournament_test_1" | "Crédito"  | "Garantido"       | 1000            | 10                  |
            | 10551 | "tournament_test_2" | "Crédito"  | "Participação"    | 0               | 1                   |
            | 10551 | "tournament_test_3" | "Crédito"  | "Garantido"       | 1000            | 5                   |
            | 10551 | "tournament_test_4" | "Diamante" | "Garantido"       | 1000            | 5                   |
            | 10551 | "tournament_test_1" | "Diamante" | "Garantido"       | 1000            | 10                  |
