class Header
    include Capybara::DSL

    def initialize
        @registration_button = 'Cadastre-se'
    end
    
    def user_logged
        find('.username').text.chomp
    end

    def click_button_register
        click_link(@registration_button)
    end
end