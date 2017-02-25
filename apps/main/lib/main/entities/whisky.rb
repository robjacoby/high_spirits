require 'types'

module Main
  module Entities
    class Whisky < Dry::Struct
      attribute :name, Types::Strict::String.optional
      attribute :age_statement, Types::Strict::Int.optional
      attribute :bottled_on, Types::Strict::Date.optional
      attribute :cask_number, Types::Strict::String.optional
      attribute :batch_number, Types::Strict::String.optional
      attribute :abv, Types::Strict::Float
    end
  end
end
