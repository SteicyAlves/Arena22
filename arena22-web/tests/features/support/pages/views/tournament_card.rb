class TournamentCard
    include Capybara::DSL

    def find_button_by_href(href)
        first("a[href='#{href}']")
    end

    def first_card_item
        first('.card-item')
    end

    def participation_button(card_item)
        card_item.find('.may-participate')
    end

    def participation_button_url(card_item)
        card_item.find('.may-participate')[:href]
    end

    def tournament_name(card_item)
        card_item.first('div.card-item p').text.strip
    end

    def get_first_tournament
        card_item = self.first_card_item
        card_item_data = { :name => tournament_name(card_item), 
                           :url => participation_button_url(card_item), 
                           :button => participation_button(card_item) }
        return card_item_data
    end
end