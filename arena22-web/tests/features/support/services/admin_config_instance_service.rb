require_relative 'service_abstract'

class AdminConfigInstanceService < ServiceAbstract

    def configure_recaptcha(state)
        admin_config_instance_db.configure_recaptcha(state)
    end
end