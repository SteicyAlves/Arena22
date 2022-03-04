class UserRegistrationPage < SitePrism::Page
    include GlobalHelpers

    set_url('/cadastre-se')

    element :name_input, '#nome'
    element :last_name_input, '#sobrenome'
    element :nickname_input, '#apelido'
    element :cpf_input, '#cpf'
    element :birth_date_input, '#dataNascimento'
    element :phone_number_input, '#numCelular'
    element :email_input, '#email'
    element :email_confirm_input, '#emailConfirma'
    element :password_input, '#senha'
    element :password_confirm_input, '#senhaConfirma'
    element :coupon_accordion, 'summary[class^="styles__AccordionSummary"]'
    element :coupon_input, '#cupom'

    def initialize
        @terms_check = '#termos'
        @email_check = '#flagEnvioEmail'
    end

    def modal
        Modal.new
    end 

    def sucess
        Sucess.new
    end

    def fill_with_optional_email(user)
        name_input.set(user.name) 
        last_name_input.set(user.last_name)
        #nickname_input.set(user.nickname)
        cpf_input.set(user.cpf)
        birth_date_input.set(user.birth_date)
        phone_number_input.set(user.phone_number)
        email_input.set(user.email)
        email_confirm_input.set(user.email)
        password_input.set(user.password)
        password_confirm_input.set(user.password)
        #coupon_accordion.click
        coupon_input.set(user.coupon)
   
        click_element(@terms_check)
        click_element(@email_check)
    end

    def fill_only_requireds_email(user)
        name_input.set(user.name) 
        last_name_input.set(user.last_name)
        #nickname_input.set(user.nickname)
        birth_date_input.set(user.birth_date)
        phone_number_input.set(user.phone_number)
        email_input.set(user.email)
        email_confirm_input.set(user.email)
        password_input.set(user.password)
        password_confirm_input.set(user.password)
   
        click_element(@terms_check)
    end

    def click_oauth_button(oauth_button)
        window = window_opened_by do
            click_button(oauth_button)
        end
        return window
    end

    def fill_with_oauth(user)
        name_input.set(user.name) 
        last_name_input.set(user.last_name)
        #nickname_input.set(user.nickname)
        cpf_input.set(user.cpf)
        birth_date_input.set(user.birth_date)
        phone_number_input.set(user.phone_number)
        #coupon_accordion.click
        coupon_input.set(user.coupon)
   
        click_element(@terms_check)
        click_element(@email_check)
    end

    def submit_form(create_button)
        click_button(create_button)
    end

end