# 整数のクラス (Integer) に機能を追加するためのモジュール
module PositiveNumberSupport::IntegerExt

  # n 桁（デフォルトは3桁）ごとに文字 separator （デフォルトは “,” ）で区切るメソッド
  # @return [String]
  # @example
  #   1234.to_currency => "1,234"
  #   1234567890.to_currency => "1,234,567,890"
  #   1234567890.to_currency() => "1,234,567,890"
  #   12345.to_currency(4,separator: " " ) => "1 2345"
  #   1234567890.to_currency(3,separator: "." ) => "1.234.567.890"
  def to_currency( n = 3 , separator: "," )
    to_s.reverse.gsub( /(\d{#{n}})(?=\d)/ , '\1' + separator ).reverse
  end

  # 16進数の文字列に変換するメソッド
  # @return [String]
  def to_two_digit_hex
    str = to_s(16)
    if str.length == 1
      "0" + str
    else
      str
    end
  end

  def meaningful?
    natural_number?
  end

  # @!group 文字列への変換

  # rjust, ljust を用いて，小数点の桁揃えを行うメソッド
  # @param [Integer (natural number)] int 整数部の桁数
  # @param [Integer (natural number)] float 小数部の桁数
  # @return [String (number)]
  # @raise [IndexError] left, right の両方が自然数でない場合に発生するエラー
  def pjust( int: 4 , float: 3 )
    raise "Error: The variables \'int\' and \'float\' should be integer." unless [ int , float ].all?( &:integer? )
    to_s.rjust( int ).ljust( float + 1)
  end

  # @!group 桁数 (digit)

  # 桁数を取得するメソッド
  # @return [Integer]
  # @example
  #   3.digit => 1
  #   17.digit => 2
  #   100.digit => 3
  #   -2000.digit => 4
  def digit
    abs.to_s.length
  end

  # @!endgroup

end
