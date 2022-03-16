class Sucess < SitePrism::Section
    include Capybara::DSL

    set_default_search_arguments 'div[class^="styles__BoxSuccess"]'
    
    element :welcome_text, 'p[class^="styles__TextScreenSucess"]', match: :first
    
    @welcome_message = 'Bem-vindo ao time '

    def dismiss_user_registered
        click_link('OK')
    end

    def have_welcome_message(nickname)
        welcome_text.has_text?(/#{@welcome_message}#{nickname}/i)
    end
end