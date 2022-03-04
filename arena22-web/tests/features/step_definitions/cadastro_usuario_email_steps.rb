Quando('preencho todos os campos do formulário') do
    @user = build(:user_with_optional)
    @user_registration_page.fill_with_optional_email(@user)
end

Quando('preencho apenas os campos obrigatórios do formulário') do
    @user = build(:user_only_requireds)
    @user_registration_page.fill_only_requireds_email(@user)
end