#encoding: UTF-8
require 'cucumber'
require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'rest-client'
require 'capybara/selenium/driver_specializations/chrome_driver'
require 'selenium/webdriver/chrome'
require 'page-object'
require 'selenium/webdriver/firefox'
require 'site_prism'
require 'yaml'
require 'rspec/core/reporter'
require 'report_builder'
require 'capybara-screenshot/cucumber'


Capybara.register_driver :selenium do |app|

  Capybara::Selenium::Driver.new(app, browser: :chrome, args: ["--start-maximized"])
end

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end

#Capybara.default_driver = :selenium
#Capybara.javascript_driver = :selenium

Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = 10 #default wait time for ajax
Capybara.ignore_hidden_elements = false
Capybara.exact = true




World(Capybara::DSL)
