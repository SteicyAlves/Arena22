class AppInstallation < SitePrism::Section
    include Capybara::DSL

    set_default_search_arguments 'h4', text: 'Arena 22 App'
    
    element :app_installation, 'h4', text: 'Arena 22 App'
    element :cancel_app, 'button[class^="styles__CloseButton"]'

    def deny_app_installation
        cancel_app.click
    end
end