module GlobalHelpers
    include Capybara::DSL
    extend self
        def get_storage_user
            timeout = Capybara.default_max_wait_time
            staging_user_capture = "return window.localStorage.getItem('staging#{CONFIG['environment']}_LOGIN_STORAGE_USER');"
            timeout.times do
                @staging_user = page.execute_script(staging_user_capture) 
                return @staging_user if @staging_user
                sleep 1
            end
        end

        def scroll_to(element)
            script = <<-JS
            arguments[0].scrollIntoView(true);
            JS
            page.execute_script(script, element.native)
            element # return the element
        end

        def scroll_page(x, y)
            page.execute_script("scrollBy(#{x},#{y});")
            sleep 1
        end

        def click_element(selector)
            timeout = Capybara.default_max_wait_time
            element_capture = "document.querySelector('#{selector}')"
            for i in 1..timeout do
                element_exits = page.execute_script("return #{element_capture}")
                if(element_exits)
                    page.execute_script("#{element_capture}.click();")
                    return
                else
                    page.execute_script("#{element_capture}.click();") if i == timeout
                    sleep 1
                end
            end
        end

        def click_list_elements(selector, initial, final)
            timeout = Capybara.default_max_wait_time
            element_capture = "document.querySelectorAll('#{selector}')"
            for i in 1..timeout do
                element_exits = page.execute_script("return #{element_capture}")
                if(element_exits)
                    for j in initial..final do
                        page.execute_script("#{element_capture}['#{j}'].click();")
                    end
                    return
                else
                    page.execute_script("#{element_capture}['#{initial}'].click();") if i == timeout
                    sleep 1
                end
            end
        end

        def upload(type, file_name, selector)
            type_options = {:tournament => 'features/support/fixtures/images/tournament/', 
                            :user => 'features/support/fixtures/images/user/'}
    
            file = File.join(Dir.pwd, "#{type_options[type]}#{file_name}") 
            file = file.tr("/", "\\")if OS.windows?

            Capybara.ignore_hidden_elements = false
            attach_file(selector, file)
            Capybara.ignore_hidden_elements = true
            sleep 2
        end

        def wait_window_close(window)
            timeout = Capybara.default_max_wait_time
            for i in 1..timeout do
                window_state = window.closed?
                if(window_state)
                    sleep 2
                    return
                else
                    sleep 1
                end
            end
        end
end