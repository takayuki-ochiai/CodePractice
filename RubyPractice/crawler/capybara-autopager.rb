# _*_ coding: utf-8 _*_
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'multi_json'
require 'autopagerize'
require 'pry'

Capybara.current_driver = :selenium
Capybara.app_host = 'http://www.yahoo.jp'
Capybara.default_wait_time = 20

module Crawler
  class LinkChecker
    include Capybara::DSL

  end
end
