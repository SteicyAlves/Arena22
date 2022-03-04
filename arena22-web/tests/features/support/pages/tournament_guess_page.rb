class TournamentGuessPage < SitePrism::Page
    include Capybara::DSL

    set_url('/clubes/{club_id}/torneios/{tournament_id}/palpites')

    section :login_container, LoginContainer

    element :first_participation_button, 'button[class*="styles__ParticipateButtonComponent"]', text: 'Participar do torneio'
    element :new_participation_button, 'button[class*="styles__ParticipateButtonComponent"]', text: 'Nova participação'

    def tournament_sidebar
        TournamentSidebar.new
    end

    def have_tournament_name(tournament_name)
        has_text?(tournament_name)
    end

    def buy_first_participation
        first_participation_button.click
    end
end