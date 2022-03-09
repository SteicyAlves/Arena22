Quando('realizo login oauth em minha {string}') do |external_account|
    @opened_window = @user_registration_page.click_oauth_button(external_account)
    external_account_data = convert_external_account_data(external_account)
    @user = build(:user_oauth, :external_account_data => external_account_data)
    @user_service.login_oauth(external_account, @opened_window, @user.email, @user.password)
end
  
Quando('preencho todas as informações restantes corretamente') do
    wait_window_close(@opened_window)
    @user_registration_page.fill_with_oauth(@user)
end