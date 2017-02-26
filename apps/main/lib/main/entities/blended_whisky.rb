require 'types'

module Main
  module Entities
    class BlendedWhisky < Dry::Struct
      class << self
        def new(attributes)
          super(Types::SymbolizedHash[attributes])
        end

        alias_method :call, :new
        alias_method :[], :new
      end

      attribute :whisky_id, Types::Strict::Int
      attribute :volume, Types::Strict::Int
      attribute :percentage_of_total, Types::Strict::Float
    end
  end
end
