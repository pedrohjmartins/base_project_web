require_relative 'helper.rb'

# Instânciando todos os objetos antes de qualqeur cenário
Before do
  @login_page = LoginPage.new
end

Before do |_feature|
  ## variable which loads the data file according to the environment
  CONFIG = YAML.load_file(
    File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml"
  )

  ## configure the chosen browser
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = CONFIG['url']
  end

  ## set resolution
  page.current_window.resize_to(1440, 900)

  ## set max wait time
  Capybara.default_max_wait_time = 10
end

After do |scenario|
  @helper = Helper.new
  ## take screenshot if scenario fail or if scenario sucess
  if scenario.failed?
    nome = scenario.name.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    @helper.take_screenshot(nome, 'screenshots/test_failed')
    embed(
      "screenshots/test_failed/#{nome}.png",
      'image/png',
      'Clique aqui para ver o screenshot !'
    )
  end
  if scenario.passed?
    nome = scenario.name.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    @helper.take_screenshot(nome, 'screenshots/test_passed')
    embed(
      "screenshots/test_passed/#{nome}.png",
      'image/png',
      'Clique aqui para ver o screenshot !'
    )
  end
  ## if the browser is different from poltergeist, kills instance
  Capybara.current_session.driver.quit unless BROWSER.eql?('poltergeist')
end
