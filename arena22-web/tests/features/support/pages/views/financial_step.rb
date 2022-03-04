class FinancialStep
    include Capybara::DSL
    include GlobalHelpers

    def initialize
        @type_prize_split_css = '#idTorneioFormatoPremiacao'
    end

    def submit_form(tournament)
        fill_financial_information(tournament)
        select_advanced_configs(tournament)
        click_button('Salvar e Avançar')
    end

    def fill_financial_information(tournament)
        find("input[name='idMoeda'][value='#{tournament.currency_type}']", visible: false).click
        find("label input[value='#{tournament.type_prize}']", visible: false).click
        fill_in('valorParticipacao', with: tournament.value_participation)
        fill_in('valorGarantidoPremiacao', with: tournament.prize_amount) if tournament.type_prize == '2'
        fill_in('taxaPorcentagem', with: tournament.administration_fee) if tournament.administration_fee
        find( @type_prize_split_css).click
        find("#{@type_prize_split_css} span", text: tournament.type_prize_split).click
        puts(tournament.limit_participation)
        fill_in('qtdMaxParticipacao', with: tournament.limit_participation) if tournament.limit_participation != 1
    end

    def select_advanced_configs(tournament)
        click_button('Configurações avançadas')
        click_element('input[name="' + tournament.tiebreaker + '"]') if tournament.tiebreaker
        click_element('input[name="' + tournament.score_format + '"]') if tournament.score_format
        click_element('input[name="' + tournament.guess_type + '"]') if tournament.guess_type
        click_element('input[name="' + tournament.postponed_match + '"]') if tournament.postponed_match
    end
end