require_relative 'service_abstract'

class TournamentService < ServiceAbstract

    def translate_options(tournament)
        type = { 'Vencedor' => '1', 'Scouts' => '2', 'Sobrevivente' => '11', 'Placar' => '12' }
        currency_type = { 'Diamante' => '1', 'Crédito' => '2', 'Moeda' => '3' }
        type_prize = { 'Participação' => '1', 'Garantido' => '2' }
        tiebreaker = { 1 => 'Divisão do prêmio', 2 => 'Ordem de entrada' }
        score_format = { 1 => 'Soma', 2 => 'Multiplicação' }
        guess_type = { 1 => 'Por partida', 2 => 'Por rodada', 3 => 'Por torneio' }
        postponed_match = { 1 => 'Aguardar partida', 2 => 'Excluir partida' }

        tournament.type = type["#{tournament.type.capitalize}"]
        tournament.currency_type = currency_type["#{tournament.currency_type.capitalize}"]
        tournament.type_prize = type_prize["#{tournament.type_prize.capitalize}"]
        tournament.tiebreaker = tiebreaker[tournament.tiebreaker]
        tournament.score_format = score_format[tournament.score_format]
        tournament.guess_type = guess_type[tournament.guess_type]
        tournament.postponed_match = postponed_match[tournament.postponed_match]
    end
end