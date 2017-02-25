module Persistence
  module Relations
    class Whiskies < ROM::Relation[:sql]
      schema(:whiskies, infer: true) do
        associations do
          belongs_to :distillery
        end
      end
    end
  end
end
