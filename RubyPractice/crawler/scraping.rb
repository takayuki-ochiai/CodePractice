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

  anemone.on_every_page do |page|

    #文字コードをUTF8に変換した上でNokogiriでパース
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text

    #カテゴリ名の表示
    sub_category = doc.xpath("//*[@id='zg_listTitle']/span").text

    puts "#{category} / #{sub_category}"
  end
end