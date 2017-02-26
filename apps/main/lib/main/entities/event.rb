require 'types'

module Main
  module Entities
    class Event < Dry::Struct
      # attribute :sequence, Types::Strict::Int
      # attribute :id, Types::Strict::String
      attribute :type, Types::Strict::String
      attribute :body, Types::Hash
    end
  end
end
