require 'types'

module Main
  module Entities
    class Measure < Dry::Struct
      attribute :bottle_id, Types::Strict::Int
      attribute :whisky_id, Types::Strict::Int
      attribute :volume, Types::Strict::Int
    end
  end
end
