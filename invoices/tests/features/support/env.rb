require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'capybara/rspec/matcher_proxies'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'

require_relative 'page_objects'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(PageObjetcs)

ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
BROWSER = ENV['BROWSER']

DATA = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENVIRONMENT_TYPE}.yaml")

Capybara.register_driver :selenium do |app|

    if BROWSER.eql?('chrome')
        # subir o chrome
        Capybara::Selenium::Driver.new(
            app,
            :browser => :chrome,
            :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                'chromeOptions' => {
                    'args' => ['window-size=1280,800']
                }
            )
        )
    elsif BROWSER.eql?('firefox')
        # subir o firefox
        Capybara::Selenium::Driver.new(
            app,
            :browser => :firefox,
            :marionette => true
        )
    elsif BROWSER.eql?('ie')
        # subir o IE (necessário instalar o IE Driver)
        Capybara::Selenium::Driver.new(
            app,
            :browser => :internet_explorer
        )
    elsif BROWSER.eql?('headless')
        # subir Phantomjs
        Capybara::Poltergeist::Driver.new(
            app,
            options = {
             :js_erros => false
            }
        )
    end

end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = DATA['url']
end

Capybara.default_max_wait_time = 5
