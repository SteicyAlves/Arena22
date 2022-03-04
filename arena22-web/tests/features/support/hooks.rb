Before do 
    @user_service = UserService.new
    @club_service = ClubService.new
    @admin_config_instance_service = AdminConfigInstance.new
    @tournament_service = TournamentService.new

    @external_window = ExternalWindow.new

    @home_page = HomePage.new
    @user_registration_page = UserRegistrationPage.new
    @login_page = LoginPage.new
    @tournament_creation_page = TournamentCreationPage.new
    @tournament_data_page = TournamentDataPage.new
    @tournament_guess_page = TournamentGuessPage.new
end

Before('@window') do 
    @admin_config_instance_service.configure_recaptcha(false)
    page.current_window.resize_to(1349, 665)
end

Before('@login') do
    @admin_config_instance_service.configure_recaptcha(false)
    page.current_window.resize_to(1349, 665)
    
    @login_page.load
    user = $user_file['user_test_1']
    @login_page.login_container.with_email(user['email'], user['password'])
    sleep 5
    
    @home_page.onesignal_dialog.deny_notification
    @home_page.app_installation.deny_app_installation
    @admin_config_instance_service.configure_recaptcha(true)
end

After('@window') do 
    @admin_config_instance_service.configure_recaptcha(true)
end

After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')

    if scenario.failed?
        save_print(scenario_name.downcase!, 'failed')
    else
        save_print(scenario_name.downcase!, 'passed')  
    end
end