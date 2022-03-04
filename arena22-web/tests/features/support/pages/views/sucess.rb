class Sucess
    include Capybara::DSL

    def header
        Header.new
    end 

    def user_registered
        first('p strong').text.strip
    end

    def dismiss_user_registered
        click_link('OK')
    end

    def have_message(message)
        has_text?(/#{message}/i)
    end
end