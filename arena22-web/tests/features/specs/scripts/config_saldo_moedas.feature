#language: pt

@script_saldo @script
Funcionalidade: Configuração de Saldo

    @script_i_saldo_usuario
    Esquema do Cenário: Inserção de Saldo para Usuário
        Para configuração dos usuários de testes
        Onde a base de dados foi atualizada e os usuários não possuem saldo suficiente
        É realizada a inserção de moedas para eles

            Dado que <codigo_usuario> é um usuario
            Quando faço inserção de <tipo_operacao> para o usuário
            Então vejo que o saldo do usuário foi atualizado

            Exemplos:
                | codigo_usuario | tipo_operacao |
                #| "user_cash_1"  | "Prêmio"      |
                #| "user_cash_1"  | "Diamante"    |
                #| "user_cash_2"  | "Prêmio"      |
                #| "user_cash_2"  | "Diamante"    |
                #| "user_cash_3"  | "Prêmio"      |
                #| "user_cash_3"  | "Diamante"    |
                #| "user_cash_4"  | "Prêmio"      |
                #| "user_cash_4"  | "Diamante"    |
                #| "user_cash_5"  | "Prêmio"      |
                #| "user_cash_5"  | "Diamante"    |
                #| "user_cash_6"  | "Prêmio"      |
                #| "user_cash_6"  | "Diamante"    |
                #| "user_cash_7"  | "Prêmio"      |
                #| "user_cash_7"  | "Diamante"    |
                #| "user_cash_8"  | "Prêmio"      |
                #| "user_cash_8"  | "Diamante"    |
                #| "user_cash_9"  | "Prêmio"      |
                #| "user_cash_9"  | "Comissão"    |
                #| "user_cash_10" | "Prêmio"      |
                #| "user_cash_10" | "Crédito"     |
                #| "user_cash_10" | "Diamante"    |
                #| "user_cash_11" | "Prêmio"      |
                #| "user_cash_11" | "Crédito"     |
                #| "user_cash_11" | "Diamante"    |
                | "user_cash_12" | "Prêmio"      |


    @script_i_saldo_clube
    Esquema do Cenário: Inserção de Saldo para Clube
        Para configuração dos clubes de testes
        Onde a base de dados foi atualizada e os clubes não possuem saldo suficiente
        É realizada a inserção de moedas para eles

            Dado que <codigo_clube> é um clube
            Quando faço inserção de <tipo_moeda> para o clube
            Então vejo que o saldo do clube foi atualizado

            Exemplos:
                | codigo_clube  | tipo_moeda |
                | "club_cash_1" | "Crédito"  |  
                | "club_cash_2" | "Crédito"  |  
                | "club_cash_3" | "Crédito"  | 
                | "club_cash_3" | "Diamante" |
                | "club_cash_4" | "Crédito"  | 
                | "club_cash_4" | "Diamante" |
                | "club_cash_5" | "Crédito"  |   
                | "club_cash_6" | "Crédito"  |
                | "club_cash_7" | "Crédito"  |