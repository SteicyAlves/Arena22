require_relative 'service_abstract'

class ClubService < ServiceAbstract

    def find_by_id(club_id)
        club_data = club_db.find_by_id(club_id).each
        club = club_data[0]
        return club
    end

    def add_value(currency_type, club_cash)
        type_balance = nil
        case currency_type
            when 'crédito'
                club_db.add_credits(club_cash[:id], club_cash[:credits])
                type_balance = 'saldoTotal'
            when 'diamante'
                club_db.add_diamonds(club_cash[:id], club_cash[:diamonds])
                type_balance = 'diamanteTotal'
            else
            log('Tipo de Moeda Inválida')
        end
        return type_balance
    end

    def expected_balance(currency_type, club_cash, club)
        case currency_type
            when 'crédito'
                initial_balance = club['saldoTotal']
                value_added = club_cash[:credits]
            when 'diamante'
                initial_balance = club['diamanteTotal']
                value_added = club_cash[:diamonds]
            else
                log('Tipo de Moeda Inválida')
        end
        expected_balance = initial_balance.to_f + value_added.to_f
        return expected_balance
    end
end