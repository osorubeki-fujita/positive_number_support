module PositiveNumberSupport::FloatExt

  # @!group 文字列への変換

  # rjust, ljust を用いて，小数点の桁揃えを行うメソッド
  # @param [Integer (natural number)] int 整数部の桁数
  # @param [Integer (natural number)] float 小数部の桁数
  # @return [String (number)]
  # @raise [IndexError] left, right の両方が自然数でない場合に発生するエラー
  def pjust( int: 4 , float: 3 )
    raise "Error: The variables \'int\' and \'float\' should be integer." unless [ int , float ].all?( &:integer? )
    /\A(\d+)\.(\d+)/ =~ to_s
    $1.rjust( int ) + "\." + $2.ljust( float )
  end

  # @!group 桁数 (digit)

  # 整数部の桁数を取得するメソッド
  # @return [Integer]
  # @example
  #   3.141592.digit => 1
  #   2.71828.digit => 1
  #   137.49.digit => 3
  #   -2015.4.digit => 4
  def digit
    ceil.digit
  end

  # @!endgroup

end
