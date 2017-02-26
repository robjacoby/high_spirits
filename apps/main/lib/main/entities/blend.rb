require 'types'
require 'main/entities/blended_whisky'

module Main
  module Entities
    class Blend < Dry::Struct
      attribute :bottle_id, Types::Strict::Int
      attribute :total_amount, Types::Strict::Float
      attribute :whiskies, Types::Coercible::Array.member(BlendedWhisky)
    end
  end
end
