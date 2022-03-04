class RealeseStep
    include Capybara::DSL
    include GlobalHelpers

    def modal
        Modal.new
    end

    def release_without_email
        sleep 8
        click_element('input[id="regras"]')

        click_button('Liberar Torneio')
        sleep 2

        modal.confirm_all_warnings
    end
end