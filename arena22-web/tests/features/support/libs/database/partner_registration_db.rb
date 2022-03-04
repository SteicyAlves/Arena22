class PartnerRegistration

    def find_partner_registration(cpf)
        DATABASE.execute("SELECT rp.idRegistroParceiro
                          FROM   RegistroParceiro AS rp
                                 INNER JOIN Usuario AS u
                                         ON rp.idUsuario = u.idUsuario
                          WHERE  u.cpf LIKE '#{cpf}';")
    end
end