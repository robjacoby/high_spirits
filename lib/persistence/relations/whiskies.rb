module Persistence
  module Relations
    class Whiskies < ROM::Relation[:sql]
      schema(:whiskies, infer: true)
    end
  end
end
