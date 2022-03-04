Dado('que {string} é um usuario') do |user_cash_code|
  @user_cash =  convert_user_cash_data(user_cash_code)
  @user = @user_service.find_user(@user_cash[:id], @user_cash[:cpf], @user_cash[:nickname], @user_cash[:site])
end
  
Quando('faço inserção de {string} para o usuário') do |currency_type|
  @currency_type = currency_type.to_s.downcase
  @type_balance = @user_service.add_value(@currency_type, @user_cash, @user)
end

Então('vejo que o saldo do usuário foi atualizado') do
  user_new_data = @user_service.find_user(@user_cash[:id], @user_cash[:cpf], @user_cash[:nickname], @user_cash[:site])
  expected_balance = @user_service.expected_balance(@currency_type, @user_cash, @user)
  expect(user_new_data[@type_balance]).to be == (expected_balance)
end

Dado('que {string} é um clube') do |club_cash_code|
  @club_cash = convert_club_cash_data(club_cash_code)
  @club = @club_service.find_by_id(@club_cash[:id])
end
  
Quando('faço inserção de {string} para o clube') do |currency_type|
  @currency_type = currency_type.to_s.downcase
  @type_balance = @club_service.add_value(@currency_type, @club_cash)
end
  
Então('vejo que o saldo do clube foi atualizado') do
  club_new_data = @club_service.find_by_id(@club_cash[:id])
  expected_balance = @club_service.expected_balance(@currency_type, @club_cash, @club)
  expect(club_new_data[@type_balance]).to be == (expected_balance)
end