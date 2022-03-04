class TournamentCreationPage < SitePrism::Page
    include Capybara::DSL
    include GlobalHelpers

    set_url('/clubes/{club_id}/torneios/criar')

    element :ok_button, 'button', text: 'OK'
    element :name_input, '#nome'
    element :description_input, '#descricao'
    elements :tournament_type, "input[name='idConfiguracaoItemTipoTorneio']", visible: false

    def initialize
        @create_button = 'Criar e avança'
        @image_input = 'avatarPath'
    end

    def modal
        Modal.new
    end

    def financial_step
        FinancialStep.new
    end

    def structure_step
        StructureStep.new
    end

    def fundamentals_step
        FundamentalsStep.new
    end

    def realese_step
        RealeseStep.new
    end

    def create_step(tournament)
        upload(:tournament, tournament.image, @image_input)
        ok_button.click

        name_input.set(tournament.name)
        description_input.set(tournament.description)
        log(tournament_type)

        find("input[name='idConfiguracaoItemTipoTorneio'][value='#{tournament.type}']", visible: false).click
        
        click_button(@create_button)
    end

end