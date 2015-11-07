# Rubygemsを使用することを明示
require 'rubygems'
# ActiveSupportを使用することを明示
require 'active_support'
# ActiveSupportに含まれる時間系の拡張機能(ライブラリ)を使用することを明示
require 'active_support/time'

require 'pry'
require 'pry-byebug'

# 1時間前(60秒*60分)の時刻
# p 1.hours.ago

# p "hoge".blank?
# ActiveSupport::Duration.new(self * 3600, [[:seconds, self * 3600]])


# p "test".to_query("key")

p [1,2,3].to_pram
