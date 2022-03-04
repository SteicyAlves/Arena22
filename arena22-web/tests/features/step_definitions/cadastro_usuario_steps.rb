Dado('que estou na tela de Cadastro do Usuário') do
    @home_page.go
    @home_page.header.click_button_register
end

Dado('acesso a tela de Cadastro do Usuário a partir do Modal de Login aberto') do
    sleep(2)
    @tournament_guess_page.login_container.click_button_register
end

Quando('clico no botão {string}') do |create_button|
    @user_registration_page.submit_form(create_button)
end

Então('o sistema exibe a tela de bem-vindo com o apelido do usuário') do
    @home_page.onesignal_dialog.deny_notification
    expect(@user_registration_page.sucess.have_welcome_message(@user.nickname)).to be true
    expect(get_storage_user).not_to be nil
end

Então('o sistema exibe a tela de bem-vindo com a mensagem {string}') do |success_message|
    @home_page.onesignal_dialog.deny_notification
    expect(@user_registration_page.sucess.have_message(success_message)).to be true
    #expect(@user_registration_page.sucess.header.user_logged).to eql @user_service.username_expected(@user)
    expect(get_storage_user).not_to be nil
end

Então('ao confirmar sou direcionado para a Tela de Palpites do Torneio') do
    @user_registration_page.sucess.dismiss_user_registered
    expect(page).to have_current_path(@card_item_data[:url], url: true)
    expect(@tournament_guess_page.have_tournament_name(@card_item_data[:name])).to be true
end