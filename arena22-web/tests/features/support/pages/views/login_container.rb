class LoginContainer < SitePrism::Section
    include Capybara::DSL

    set_default_search_arguments 'div[class^="styles__Box"]'

    element :registration_button, 'a', text: 'Cadastre-se!'
    element :email_input, '#email'
    element :password_input, '#password'
    element :log_in_button, 'button', text: 'Entrar'
    element :google_button, 'button', text: 'Entre com Google'
    element :facebook_button, 'button', text: 'Entre com Facebook'

    def click_button_register
        registration_button.click
    end

    def with_email(email, password)
        email_input.set(email)
        password_input.set(password)

        log_in_button.click
    end

    def with_google
        google_button.click
    end

    def with_facebook
        facebook_button.click
    end    
end