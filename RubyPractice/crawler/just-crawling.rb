# _*_ coding: utf-8 _*_
require 'anemone'

# anemone内蔵のnokogiriは文字コードに対する対処を変更できないため、nokogiriを別途定義する。
require 'nokogiri'
require 'kconv'

# urls = [
#   "http://www.amazon.co.jp/gp/bestsellers/books/",
#   "http://www.amazon.co.jp/gp/bestsellers/digital-text/2275256051/"
# ]

# Anemone.crawl(
#   urls, :depth_limit => 1, :skip_query_strings => true) do |anemone|
#
#   # 巡回先の絞り込み
#   anemone.focus_crawl do |page|
#     page.links.keep_if do |link|
#       link.to_s.match(%r!gp/bestsellers/books|/gp/bestsellers/digital-text!)
#     end
#   end
#
#   # 取得したページに対する処理
#
#
#   # 対象を「ビジネス・経済」と「コンピュータ・IT」に絞り込む
#   PATTERN = %r[466298/+|466282/+|2291657051/+|2291905051/+]
#   anemone.on_pages_like(PATTERN) do |page|
#     puts page.url
#   end
#   # anemone.on_every_page do |page|
#   #   puts page.url
#   # end
# end

# 文字コード変換
def doc
  return @doc if @doc
  @doc = Nokogiri::HTML(@body) if @body && html? rescue nil
end


# 目的のページが決まっていて少数であればページ指定のクローラーを作ったほうが効率的
# 一方で不特定のページから条件に当てはまる上オフを抜きだ黄桃い目的であれば巡回ルールを作ったほうがいい
urls = [
  "http://www.amazon.co.jp/gp/bestsellers/books/466282/ref=zg_bs_nav_b_1_b/375-8742965-3698649",
  "http://www.amazon.co.jp/gp/bestsellers/books/466298/ref=zg_bs_nav_b_1_b/375-8742965-3698649",
  "http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/ref=zg_bs_nav_kinc_2_2275256051/375-1552538-4646124",
  "http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/ref=zg_bs_nav_kinc_2_2275256051/375-1552538-4646124"
]


Anemone.crawl(urls, :depth_limit => 0) do |anemone|
  anemone.on_every_page do |page|


    puts page.url

    # 文字コードをUTF8に変換した上でNokogiriでパース
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text

    sub_category = doc.xpath("//*[@id=\"zg_listTitle\"]/span").text

    puts "#{category}/#{sub_category}\n\n"
    items = doc.xpath("//div[@class=\"zg_itemRow\"]/div[1]/div[2]")

    items += doc.xpath("//div[@class=\"zg_itemRow\"]/div[2]/div[2]")

    items.each do |item|
      # 順位
      puts item.xpath("div[1]/span[1]").text

      # 書籍名
      puts item.xpath("div[\"zg_title\"]/a").text

      # ASIN
      puts item.xpath("div[\"zg_title\"]/a")
             .attribute("href").text.match(%r[dp/(.+?)/])[1]
      puts ""
    end
  end
end
