# _*_ coding: utf-8 _*_
require 'cgi'
require 'pry'
require 'open-uri'


def parse(page_source)
  # エンコーディング属性について注意
  page_source.force_encoding('UTF-8')
  page_source.scrub!('?')
  dates = page_source.scan(
    %r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!
  )
  url_titles = page_source.scan(
    %r!^<a href="(.+?)">(.+?)</a><br />!
  )
  url_titles.zip(dates).map{ |(aurl, atitle), ymd|
    [CGI.unescapeHTML(aurl), CGI.unescapeHTML(atitle), Time.local(*ymd)]
  }
end


def format_text(title, url, url_title_time_ary)
  s = "Title: #{title}\nURL: #{url}\n\n"
  url_title_time_ary.each do |aurl, atitle, atime|
    s << "* (#{atime})#{atitle}\n"
    s << "    #{aurl}\n"
  end
  s
end

page_source = open('http://crawler.sbcr.jp/samplepage.html', &:read)
puts format_text("WWW.SBCR.JP トピックス",
  "http://crawler.sbcr.jp/samplepage.html",
  parse(page_source)
)
