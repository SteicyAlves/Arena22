class LoginPage < SitePrism::Page
    include Capybara::DSL

    set_url('/login')

    section :login_container, LoginContainer
end