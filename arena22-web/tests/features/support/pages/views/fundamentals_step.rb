class FundamentalsStep
    include Capybara::DSL
    include GlobalHelpers

    def submit_form(tournament)
        sleep 5
        fill_in('timesPorFundamento', with: tournament.teams_by_fundamentals)
        click_list_elements('input[name="fundamentos[]"]', 0, tournament.number_fundamentals - 1)
        click_button('Salvar e Avançar')
    end

    def submit_form_if_required(tournament)
        if(tournament.type == '2')
            submit_form(tournament)
        end
    end    
end