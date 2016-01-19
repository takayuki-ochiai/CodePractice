require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.current_driver = :selenium
Capybara.app_host = 'https://affiliate.amazon.co.jp'
Capybara.default_wait_time = 5

module Crawler
  class Amazon
    include Capybara::DSL

    def login
      visit('/')
      fill_in 'username', :with => 'username'
      fill_in 'password', :with => 'password'
      click_button "サインイン"
    end

  end
end

crawler = Crawler::Amazon.new
crawler.login
