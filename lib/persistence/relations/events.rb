module Persistence
  module Relations
    class Events < ROM::Relation[:sql]
      schema(:events, infer: true)
    end
  end
end
