module Persistence
  module Relations
    class BottlesWhiskies < ROM::Relation[:sql]
      schema(:bottles_whiskies, infer: true) do
        associations do
          belongs_to :bottle
          belongs_to :whisky
        end
      end
    end
  end
end
