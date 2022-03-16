class Header < SitePrism::Section
    include Capybara::DSL

    set_default_search_arguments 'header'

    element :registration_button, 'button[class^="styles__SignUpButton"]', text: 'Cadastre-se'
    
    def user_logged
        find('.username').text.chomp
    end

    def click_button_register
        registration_button.click
    end
end