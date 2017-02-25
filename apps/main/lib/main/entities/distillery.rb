require 'types'

module Main
  module Entities
    class Distillery < Dry::Struct
      attribute :name, Types::Strict::String
      attribute :location, Types::Strict::String
      attribute :region, Types::Strict::String
      attribute :owned_by, Types::Strict::String.optional
      attribute :created_at, Types::Strict::DateTime
      attribute :updated_at, Types::Strict::DateTime
    end
  end
end
