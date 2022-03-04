Dado('que eu esteja conectado no BD') do
  @user_connection = User.new
end
  
Quando('eu realizo um select no banco') do
  @nome = @user_connection.find_by_cpf('66185325314')
end
  
Então('eu vejo o resultado do meu select') do
  @nome.each do |user|
    log(user['nome'])
  end
end