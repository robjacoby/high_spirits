require 'types'

module Main
  module Entities
    class Bottle < Dry::Struct
      attribute :name, Types::Strict::String
      attribute :volume, Types::Strict::Int
    end
  end
end
