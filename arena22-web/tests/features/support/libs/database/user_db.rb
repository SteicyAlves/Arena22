class User

    def find_by_id(user_id, site_id)
        DATABASE.execute("SELECT *
                          FROM   Usuario
                          WHERE  idUsuario = #{user_id}
                                 AND idSite = #{site_id}
                          ORDER  BY idUsuario DESC;")
    end
   
    def find_by_cpf(cpf, site_id)
        DATABASE.execute("SELECT *
                          FROM   Usuario
                          WHERE  cpf LIKE '#{cpf}' 
                                 AND idSite = #{site_id}
                          ORDER  BY idUsuario DESC;")
    end

    def find_by_nickname(nickname, site_id)
        DATABASE.execute("SELECT *
                          FROM   Usuario
                          WHERE  apelido LIKE '#{nickname}' 
                                 AND idSite = #{site_id}
                          ORDER  BY idUsuario DESC;")
    end

    def add_credits(user_id, value)
        DATABASE.execute("EXECUTE [dbo].[usp_SetUsuarioSaldo] #{user_id}, 'C', #{value}, NULL, NULL, 'Crédito Automatizado', 
                          8, NULL, NULL, NULL, NULL, NULL;")
    end

    def add_balance(user_id, operation, value, type, balance_name)
        DATABASE.execute("EXECUTE [dbo].[usp_SetUsuarioSaldo] #{user_id}, '#{operation}', #{value}, NULL, NULL, '#{balance_name} Automatizado', 
                          #{type}, NULL, NULL, NULL, NULL, NULL;")
    end

    def add_diamonds(user_id, value)
        DATABASE.execute("EXECUTE [dbo].[usp_SetUsuarioSaldoDiamante] #{user_id}, 'C', #{value}, 'Bônus Automatizado', 8, 
                          NULL, NULL, NULL;")
    end

    def disable_user_by_email(email)
        DATABASE.execute("UPDATE Usuario 
                          SET flagAtivo = 0
                          WHERE email like '%#{email}%';")
    end
end