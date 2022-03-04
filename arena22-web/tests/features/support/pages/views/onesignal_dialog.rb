class OnesignalDialog < SitePrism::Section
    include Capybara::DSL

    set_default_search_arguments '#onesignal-slidedown-dialog'
    
    element :notification, '#onesignal-slidedown-dialog'
    element :allow_notification, '#onesignal-slidedown-allow-button'
    element :cancel_notification, '#onesignal-slidedown-cancel-button', text: 'Prefiro perder'

    def deny_notification
        cancel_notification.click
    end
end