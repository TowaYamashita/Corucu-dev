# 検索範囲の拡張
# 20AA/BB/CC 00:00 ~ 20XX/YY/ZZ 23:59
# 参考1: https://www.tom08.net/entry/2016/07/19/180127
# 参考2: https://github.com/activerecord-hackery/ransack/wiki/Custom-Predicates

Ransack.configure do |config|
    config.add_predicate 'lteq_end_of_day',
                         :arel_predicate => 'lteq',
                         :formatter => proc {|v| v.end_of_day},
                         :compounds => false
  end