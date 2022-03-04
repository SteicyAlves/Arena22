class TournamentSidebar
    include Capybara::DSL

    def tournament_name
        find('p span').text.strip
    end
end