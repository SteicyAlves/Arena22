require_relative '../../models/tournament_model'
require_relative '../../services/tournament_service'

FactoryBot.define do
    factory :test_tournament, class: TournamentModel do
        transient do
            tournament_data { nil }
        end
    
        type { tournament_data[:type] }
        name { tournament_data[:name] } 
        description { tournament_data[:description] }
        image { tournament_data[:image] }
        currency_type { nil }
        type_prize { nil }
        value_participation { tournament_data[:value_participation] }
        prize_amount { nil }
        administration_fee { tournament_data[:administration_fee] }
        type_prize_split { tournament_data[:type_prize_split] }
        limit_participation { nil }
        tiebreaker { tournament_data[:tiebreaker] }
        score_format { tournament_data[:score_format] }
        guess_type { tournament_data[:guess_type] }
        postponed_match { tournament_data[:postponed_match] }
        country { tournament_data[:country] }
        championship { tournament_data[:championship] }
        round { tournament_data[:round] }
        number_matches_rounds { tournament_data[:number_matches_rounds] }
        teams_by_fundamentals { tournament_data[:teams_by_fundamentals] }
        number_fundamentals { tournament_data[:number_fundamentals] }
        initial_date { tournament_data[:initial_date] }
        final_date { tournament_data[:final_date] }

        after(:build) do |tournament|
            TournamentService.new.translate_options(tournament)
        end
        
    end
end