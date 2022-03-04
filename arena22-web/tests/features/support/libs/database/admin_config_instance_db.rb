class AdminConfigInstance
    def configure_recaptcha(state)
        DATABASE.execute("UPDATE aci
                          SET aci.vlConfigInstance = '#{state}'
                          FROM AdminConfigInstance AS aci
                               INNER JOIN AdminConfigDef AS acd
                                       ON aci.idConfigDef = acd.idConfigDef
                          WHERE acd.cdConfigDef IN('reCaptchaCadastroAtivo', 'reCaptchaLoginAtivo' );")
    end
end