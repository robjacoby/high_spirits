module Persistence
  module Relations
    class Distilleries < ROM::Relation[:sql]
      schema(:distilleries) do
        attribute :id, Types::Serial
        attribute :name, Types::Strict::String
        attribute :location, Types::Strict::String
        attribute :region, Types::Strict::String
        attribute :owned_by, Types::Maybe::String
      end
    end
  end
end
