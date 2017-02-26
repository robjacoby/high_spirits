module Persistence
  module Relations
    class Blends < ROM::Relation[:sql]
      schema(:blends, infer: true) do
        associations do
          belongs_to :bottle
        end
      end

      def by_bottle_id(bottle_id)
        where(bottle_id: bottle_id)
      end
    end
  end
end
