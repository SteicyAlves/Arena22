class TournamentDataPage < SitePrism::Page
    include Capybara::DSL

    element :tournament_name, 'p.big'

    def tournament_name
        tournament_name.text.strip
    end
end