module ConvertDataFiles

    def convert_user_data(user_code)
        user = $user_file[user_code.to_s.downcase]
        location = '[Arquivo: user.yaml]'
        converted_user = { :name => validate_required(user['name'], 'name', location),
                           :last_name => validate_required(user['last_name'], 'last_name', location),
                           :nickname => validate_required(user['nickname'], 'nickname', location),
                           :cpf => validate_cpf(user['cpf'], location),
                           :birth_date => validate_date(user['birth_date'], 'Birth_date', location),
                           :phone_number => validate_phone_number(user['phone_number'], 'Phone_number', location),
                           :email => validate_email(user['email'], 'Email', location),
                           :password => validate_password(user['password'], 'Password', location),
                           :coupon => user['coupon']
                        }
        return converted_user
    end

    def convert_user_cash_data(user_cash_code)
        user_cash = $user_cash_file[user_cash_code.to_s.downcase]
        location = '[Arquivo: user_cash.yaml]'
        converted_user_cash = { :id => validate_optional_integer(user_cash['id'], 'Id', location),
                                :cpf => validate_optional_cpf(user_cash['cpf'], location),
                                :nickname => user_cash['nickname'],
                                :site => validate_integer(user_cash['site'], 'Site', location),
                                :credits => validate_cash(user_cash['crédito'], location),
                                :commission => validate_cash(user_cash['comissão'], location),
                                :prize => validate_cash(user_cash['prêmio'], location),
                                :diamonds => validate_cash(user_cash['diamante'], location)
                              }
        return converted_user_cash
    end

    def convert_external_account_data(external_account)
        external_account = $external_account_file[external_account.to_s.downcase]
        location = '[Arquivo: external_account.yaml]'
        converted_external_account = { :type => validate_required(external_account['type'], 'type', location),
                                       :nickname => external_account['nickname'],
                                       :email => validate_email(external_account['email'], 'Email', location),
                                       :password => validate_required(external_account['password'], 'password', location)
                                     }
        return converted_external_account
    end

    def convert_club_cash_data(club_cash_code)
        club_cash = $club_cash_file[club_cash_code.to_s.downcase]
        location = '[Arquivo: club_cash.yaml]'
        converted_club_cash = { :id => validate_integer(club_cash['id'], 'Id', location),
                                :credits => validate_cash(club_cash['crédito'], location),
                                :diamonds => validate_cash(club_cash['diamante'], location)
                              }
        return converted_club_cash
    end

    def convert_tournament_data(tournament_code)
        tournament = $tournament_file[tournament_code.to_s.downcase]
        location = '[Arquivo: tournament.yaml]'
        converted_tournament = {  :type => validate_required(tournament['type'], 'type', location),
                                  :name => validate_required(tournament['name'], 'name', location), 
                                  :description => tournament['description'],
                                  :image => tournament['image'].to_s.strip,
                                  :value_participation => validate_integer(tournament['value_participation'], 'Value_participation', location),
                                  :administration_fee => validate_optional_percentage(tournament['administration_fee'], 'Administration_fee', location),
                                  :type_prize_split => validate_required(tournament['type_prize_split'], 'type_prize_split', location),
                                  :tiebreaker => validate_optional_integer(tournament['tiebreaker'], 'Tiebreaker', location),
                                  :score_format => validate_optional_integer(tournament['score_format'], 'Score_format', location),
                                  :guess_type => validate_optional_integer(tournament['guess_type'], 'Guess_type', location),
                                  :postponed_match => validate_optional_integer(tournament['postponed_match'], 'Postponed_match', location),
                                  :country => validate_required(tournament['country'], 'country', location),
                                  :championship => validate_required(tournament['championship'], 'championship', location),
                                  :round => tournament['round'],
                                  :number_matches_rounds => validate_integer(tournament['number_matches_rounds'], 'Number_matches_rounds', location),
                                  :teams_by_fundamentals => validate_optional_integer(tournament['teams_by_fundamentals'], 'Teams_by_fundamentals', location),
                                  :number_fundamentals => validate_optional_integer(tournament['number_fundamentals'], 'Number_fundamentals', location),
                                  :initial_date => validate_optional_date(tournament['initial_date'], 'Initial_date', location),
                                  :final_date => validate_optional_date(tournament['final_date'], 'Final_date', location)
                              }
        return converted_tournament
    end
end