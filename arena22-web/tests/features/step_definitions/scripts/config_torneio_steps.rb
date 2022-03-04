Dado('que estou na tela de Cadastro de Torneio de um {int}') do |club_id|
  @tournament_creation_page.load(club_id: club_id)
end

Quando('faço a liberação de um {string} de {string}, {string}, {int} e {int}') do |tournament_code, currency_type, type_prize, prize_amount, limit_participation|
  @tournament_data =  convert_tournament_data(tournament_code)
  @tournament = build(:test_tournament, :tournament_data => @tournament_data, 
                                  currency_type: currency_type, 
                                  type_prize: type_prize, 
                                  prize_amount: prize_amount, 
                                  limit_participation: limit_participation)

  @tournament_creation_page.create_step(@tournament)
  @tournament_creation_page.financial_step.submit_form(@tournament)
  @tournament_creation_page.structure_step.submit_form(@tournament)
  @tournament_creation_page.fundamentals_step.submit_form_if_required(@tournament)
  @tournament_creation_page.realese_step.release_without_email
end

Então('vejo que o torneio foi cadastrado com sucesso') do
  expect(@tournament_creation_page.modal.tournament_released_message).to eql 'Torneio liberado com sucesso!'
end