require_relative '../libs/database/user_db'
require_relative '../libs/database/club_db'
require_relative '../libs/database/admin_config_instance_db'
require_relative '../pages/views/external_window'

class ServiceAbstract
    attr_accessor :user_db, :club_db, :admin_config_instance_db, :external_window

    def initialize
        self.user_db = User.new
        self.club_db = Club.new
        self.admin_config_instance_db = AdminConfigInstance.new
        self.external_window = ExternalWindow.new
    end
end