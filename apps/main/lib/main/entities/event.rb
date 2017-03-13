require 'types'

module Main
  module Entities
    class Event < Dry::Struct
      attribute :type, Types::Strict::String
      attribute :body, Types::Hash
    end

    class EventWithSequence < Event
      attribute :sequence, Types::Strict::Int
    end
  end
end
