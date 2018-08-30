require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'
require 'capybara/poltergeist'
require 'allure-cucumber'
require 'httparty'

#Necessário para não ocorrer erro do allure
Cucumber::Core::Test::Step.module_eval do
  def name
    return text if text == 'Before hook'
    return text if text == 'After hook'
    "#{source.last.keyword}#{text}"
  end
end

#Configurando as tags para as features
AllureCucumber.configure do |c|
  c.clean_dir = true
  c.tms_prefix      = '@idjira'
  c.issue_prefix    = '@iderro'
  c.severity_prefix = '@criticidade:'
end

BROWSER = ENV['BROWSER']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome_headless')
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {
          'args' => ['headless', 'window-size=1280x720', 'disable-gpu', 'no-sandbox']
        }
      )
    )
  elsif BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  elsif BROWSER.eql?('internet_explorer')
    Capybara::Selenium::Driver.new(app, browser: :internet_explorer)
  elsif BROWSER.eql?('safari')
    Capybara::Selenium::Driver.new(app, browser: :safari)
  elsif BROWSER.eql?('poltergeist')
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
  end
end
