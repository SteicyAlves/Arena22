class Modal
    include Capybara::DSL

    def initialize
        @warning_css = 'div[type=warning]'
        @error_css = 'div[type=error]'
    end

    def warning_message
        find(@warning_css).text.strip
    end

    def verify_warning
        has_selector?(@warning_css)
    end

    def confirm_warning
        find(@warning_css).click_button('Sim')
    end

    def confirm_all_warnings
        modal_exists = self.verify_warning
        while modal_exists do
            self.confirm_warning
            sleep 1
            modal_exists = self.verify_warning
        end
    end

    def deny_warning
        find(@warning_css).click_button('Não')
    end

    def error_message
        find(@error_css).text.strip
    end

    def dismiss_error
        find(@error_css).click_button('OK')
    end

    def tournament_released_message
        find('button[role="dismiss"]').ancestor('div[class^="Modal__wrap"]').text.strip.delete!("×\n")
    end

    def dismiss_tournament_released
        find('button[role="dismiss"]').click
    end
end