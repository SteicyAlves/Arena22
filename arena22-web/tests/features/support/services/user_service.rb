require_relative 'service_abstract'

class UserService < ServiceAbstract

    def find_by_id(user_id, site_id)
        user_data = user_db.find_by_id(user_id, site_id).each
        user = user_data[0]
        return user
    end

    def find_by_cpf(cpf, site_id)
        user_data = user_db.find_by_cpf(cpf, site_id).each
        user = user_data[0]
        return user
    end

    def find_by_nickname(nickname, site_id)
        user_data = user_db.find_by_nickname(nickname, site_id).each
        user = user_data[0]
        return user
    end

    def find_user(user_id, cpf, nickname, site_id)
        if(user_id)
            self.find_by_id(user_id, site_id)
        elsif(cpf)
            self.find_by_cpf(cpf, site_id)
        elsif(nickname)
            self.find_by_nickname(nickname, site_id)
        else
            puts('Informe Id, CPF ou Apelido do Usuário')
        end
    end

    def add_value(currency_type, user_cash, user)
        user_id = user['idUsuario'].to_i
        type_balance = nil
        case currency_type
            when 'crédito'
                user_db.add_balance(user_id, 'C', user_cash[:credits], '8', 'Crédito')
                type_balance = 'saldoTotal'
            when 'comissão'
                user_db.add_balance(user_id, 'CM', user_cash[:commission], '6', 'Comissão')
                type_balance = 'saldoTotal'
            when 'prêmio'
                user_db.add_balance(user_id, 'P', user_cash[:prize], '8', 'Prêmio')
                type_balance = 'saldoTotal'
            when 'diamante'
                user_db.add_diamonds(user_id, user_cash[:diamonds])
                type_balance = 'diamanteTotal'
            else
                puts('Tipo de Operação Inválida')
        end
        return type_balance
    end

    def expected_balance(currency_type, user_cash, user)
        case currency_type
            when 'crédito'
                initial_balance = user['saldoTotal']
                value_added = user_cash[:credits]
            when 'comissão'
                initial_balance = user['saldoTotal']
                value_added = user_cash[:commission]
            when 'prêmio'
                initial_balance = user['saldoTotal']
                value_added = user_cash[:prize]
            when 'diamante'
                initial_balance = user['diamanteTotal']
                value_added = user_cash[:diamonds]
            else
                puts('Tipo de Operação Inválida')
        end
        expected_balance = initial_balance.to_f + value_added.to_f
        return expected_balance
    end

    def disable_user_by_email(email)
        user_db.disable_user_by_email(email.to_s)
    end

    def login_oauth(external_account, window, email, password)
        case external_account.to_s.capitalize
            when 'Google'
                external_window.login_google(window, email, password)
            when 'Facebook'
                external_window.login_facebook(window, email, password)
            else
                puts('Tipo de Conta Externa Inválida')
        end
    end

    def username_expected(user)
        if(user.nickname)
            return user.nickname
        else
            return user.name
        end
    end
end