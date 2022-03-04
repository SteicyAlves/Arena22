class ExternalWindow
    include Capybara::DSL
    include GlobalHelpers

    def login_google(window, email, password)
        within_window window do
            fill_in('identifier', with: email)
            find('#identifierNext').click
            fill_in('password', with: password)
            find('#passwordNext').click
        end
    end

    def login_facebook(window, email, password)
        within_window window do
            fill_in('email', with: email)
            fill_in('pass', with: password)
            find('#loginbutton').click
        end
        unless(has_selector?('div[role="alert"]', text: 'Preencha os campos indicados para finalizar seu cadastro'))
            within_window window do
                click_button('__CONFIRM__')
            end
        end
    end
end