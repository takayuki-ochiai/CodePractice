# -*- coding: utf-8 -*-
require 'anemone'
require 'nokogiri'
require 'kconv'

#クロールの起点となるURLを指定
urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/ref=zg_bs_nav_b_1_b/376-9685639-5537046")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/ref=zg_bs_nav_b_1_b/376-9685639-5537046")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/ref=zg_bs_nav_kinc_2_2275256051/376-5464161-8414550")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/ref=zg_bs_nav_kinc_2_2275256051/376-5464161-8414550")

Anemone.crawl(urls,:depth_limit => 0) do |anemone|

  # # 巡回先の絞り込み
  # anemone.focus_crawl do |page|
  #   page.links.keep_if { |link|
  #     link.to_s.match(/\/gp\/bestsellers\/books|\/gp\/bestsellers\/digital-text/)
  #   }
  # end

  # # 取得したページに対する処理
  # PATTERN = %r[466298\/+|466282\/+|2291657051\/+|2291905051\/+]
  # anemone.on_pages_like(PATTERN) do |page|
  #   puts page.url
  # end

  anemone.on_every_page do |page|
    puts page.url
  end
end