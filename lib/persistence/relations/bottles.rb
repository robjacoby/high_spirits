module Persistence
  module Relations
    class Bottles < ROM::Relation[:sql]
      schema(:bottles, infer: true)
    end
  end
end
