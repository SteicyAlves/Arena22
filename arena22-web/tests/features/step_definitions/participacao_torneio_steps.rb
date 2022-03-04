Dado('que estou na tela de Palpites de um Torneio') do
    @home_page.go
    @card_item_data = @home_page.tournament_card.get_first_tournament
    @card_item_data[:button].click
end

Dado('que tento Comprar uma Participação em um Torneio') do
    @home_page.go
    @card_item_data = @home_page.tournament_card.get_first_tournament
    @card_item_data[:button].click
    @tournament_guess_page.buy_first_participation
end