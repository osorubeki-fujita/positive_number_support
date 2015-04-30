require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.0"

describe PositiveNumberSupport do
  it "has a version number \'#{ version }\'" do
    expect( ::PositiveNumberSupport::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::PositiveNumberSupport::VERSION , spec_filename ) ).to eq( true )
  end

  it 'has method for getting digit' do
    expect( 1234.to_currency ).to eq( "1,234" )
    expect( 1234567890.to_currency ).to eq( "1,234,567,890" )
    expect( 1234567890.to_currency ).to eq( "1,234,567,890" )
    expect( 12345.to_currency(4,separator: " " ) ).to eq( "1 2345" )
    expect( 1234567890.to_currency(3,separator: "." ) ).to eq( "1.234.567.890" )
  end

  it 'has method for getting digit' do
    expect( 3.digit ).to eq(1)
    expect( 17.digit ).to eq(2)
    expect( 100.digit ).to eq(3)
    expect( -2000.digit ).to eq(4)

    expect( 3.141592.digit ).to eq(1)
    expect( 2.71828.digit ).to eq(1)
    expect( 137.49.digit ).to eq(3)
    expect( -2015.4.digit ).to eq(4)
  end
end
