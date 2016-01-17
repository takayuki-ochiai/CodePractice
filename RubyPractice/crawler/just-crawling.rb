# _*_ coding: utf-8 _*_
require 'anemone'

urls = [
  "http://www.amazon.co.jp/gp/bestsellers/books/",
  "http://www.amazon.co.jp/gp/bestsellers/digital-text/2275256051/"
]


Anemone.crawl(
  urls, :depth_limit => 1, :skip_query_strings => true) do |anemone|

  # 巡回先の絞り込み
  anemone.focus_crawl do |page|
    page.links.keep_if do |link|
      link.to_s.match(%r!gp/bestsellers/books|/gp/bestsellers/digital-text!)
    end
  end

  # 取得したページに対する処理


  # 対象を「ビジネス・経済」と「コンピュータ・IT」に絞り込む
  PATTERN = %r[466298/+|466282/+|2291657051/+|2291905051/+]
  anemone.on_pages_like(PATTERN) do |page|
    puts page.url
  end
  # anemone.on_every_page do |page|
  #   puts page.url
  # end
end
