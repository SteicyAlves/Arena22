Dado('que eu esteja na tela de Cadastro de Usuário') do
    @user_registration_page.load
end

Quando('faço cadastro do {string} de teste') do |user_code|
    @user_data = convert_user_data(user_code)
    @user = build(:test_user, :user_data => @user_data)
    @user_registration_page.fill_with_optional_email(@user)
    @user_registration_page.submit_form("Criar conta")
end

Então('vejo que o usuário foi cadastrado com sucesso') do
    expect(@user_registration_page.sucess.have_message('Seu cadastro foi realizado com sucesso!')).to be true
end