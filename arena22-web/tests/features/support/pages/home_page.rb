class HomePage < SitePrism::Page
    include Capybara::DSL

    set_url('/')

    section :onesignal_dialog, OnesignalDialog
    section :app_installation, AppInstallation

    def header
        Header.new
    end

    def tournament_card
        TournamentCard.new
    end

    def go
        load
        app_installation.deny_app_installation
    end
end