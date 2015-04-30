require_relative "positive_number_support/version"

require "active_support"
require "active_support/core_ext"

require "positive_basic_support"

[ :integer , :float ].each do | filename |
  require_relative "positive_number_support/#{ filename }_ext"
end

module PositiveNumberSupport

  extend ::ActiveSupport::Concern

  included do

    [ :Integer , :Float ].each do | class_name |
      eval <<-INCLUDE
        ::#{ class_name }.class_eval do
          include ::PositiveNumberSupport::#{ class_name }Ext
        end
      INCLUDE
    end
  end

end

include PositiveNumberSupport
