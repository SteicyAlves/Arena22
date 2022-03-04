class StructureStep
    include Capybara::DSL
    include GlobalHelpers

    def initialize
        @championship_css = '#campeonato'
        @championship_option_css = "#{@championship_css} span"
        @country_css = '#pais'
        @country_option_css = "#{@country_css} span"
        @round_css = '#rodada'
        @round_option_css = "#{@round_css} span"
    end

    def submit_form(tournament)
        filter_championship(tournament)
        choose_cards(tournament)
        click_button('Salvar e Avançar')
    end

    def filter_championship(tournament)
        click_element(@country_css)
        sleep 2
        #fill_in('input.search-input', with: tournament.country) if tournament.country
        tournament.country ? find(@country_option_css, text: tournament.country).click : find(@country_option_css, text: 'Todos...').click
        confirm_filter(tournament.type)
        sleep 2

        click_element(@championship_css)
        tournament.championship ? find(@championship_option_css, text: tournament.championship).click : click_list_elements(@championship_option_css, 0, 0)
        confirm_filter(tournament.type)
        sleep 2

        if(tournament.round)
            find(@round_css).click
            find(@round_option_css, text: tournament.round).click
        end

       fill_in('dataInicial', with: tournament.initial_date)
       fill_in('dataFinal', with: tournament.final_date)
       sleep 2
    end

    def confirm_filter(tournament_type)
        if(tournament_type == '1' || tournament_type == '12')
            click_button('OK')
        end
    end

    def choose_cards(tournament)
        if(tournament.type == '11')
            click_list_elements('.right input', 0, tournament.number_matches_rounds - 1)  
        else
            click_list_elements('.right input', 1, tournament.number_matches_rounds)
        end
    end
end