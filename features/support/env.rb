require 'spec/expectations'
require 'rack/test'
require 'capybara'
require 'capybara/cucumber'
    
# require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
# require 'cucumber/rails/world'
# require 'cucumber/web/tableish'

# require 'capybara/rails'
# require 'capybara/cucumber'
# require 'capybara/session'
# require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without using @culerity or @javascript
# Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
# order to ease the transition to Capybara we set the default here. If you'd
# prefer to use XPath just remove this line and adjust any selectors in your
# steps to use the XPath syntax.
Capybara.default_selector = :css

app_file = File.join(File.dirname(__FILE__), *%w[.. .. etorki.rb])
require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

Capybara.app = Sinatra::Application

class MyWorld
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}

