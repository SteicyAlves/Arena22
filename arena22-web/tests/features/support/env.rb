require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'report_builder'
require 'tiny_tds'
require 'factory_bot'
require 'faker'
require 'os'
require 'securerandom'
require 'date'
require 'pry'

require_relative './helpers/print'
require_relative './helpers/global_helpers'
require_relative './helpers/convert_data_files'
require_relative './helpers/validation_data'

#Setting Global Classes and Modules
World(Print)
World(FactoryBot::Syntax::Methods)
World(GlobalHelpers)
World(ConvertDataFiles)
World(ValidationData)

#Setting Test Environment
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/environment/#{ENV['ENV_TYPE']}.yaml"))


#Creating Conection with DataBase
DATABASE = TinyTds::Client.new(CONFIG['database'])


#Browsers Configuration
case  ENV['BROWSER']
  when 'Firefox'
    @driver = :selenium
  when 'Chrome'
    @driver = :selenium_chrome
  when 'Internet_Explorer'
    @driver = :ie
  when 'Edge'
    @driver = :edge
  when 'Opera'
    @driver = :opera
  when 'Headless'
    @driver = :selenium_chrome_headless
  else
    puts('Browser Inválido')
end


#Faker Configuration
Faker::Config.locale = 'pt-BR'


#Capybara Configuration
Capybara.configure do |config|

  Capybara.register_driver :ie do |app|
    Capybara::Selenium::Driver.new(app, :browser => :ie)
  end

  Capybara.register_driver :edge do |app|
    Selenium::WebDriver::Edge::Service.driver_path = "C:/Windows/msedgedriver.exe"
    capabilities = Selenium::WebDriver::Remote::Capabilities.edge(edgeOptions: {'w3c' => false}, 
                                                                  :javascript_enabled => true,
                                                                  :css_selectors_enabled => true)
    Capybara::Selenium::Driver.new(app, :browser => :edge, desired_capabilities: capabilities)
  end

  Capybara.register_driver :opera do |app|
    driver = Selenium::WebDriver.for :opera
    Capybara::Selenium::Driver.new(app, :browser => driver)
  end

  config.default_driver = @driver
  config.app_host = CONFIG['url']
  config.default_max_wait_time = 20
end

#Fixtures Files
$user_cash_file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/user_cash.yaml'))
$club_cash_file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/club_cash.yaml'))
$user_file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/user.yaml'))
$tournament_file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/tournament.yaml'))
$external_account_file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/external_account.yaml'))