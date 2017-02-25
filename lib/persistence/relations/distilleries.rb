module Persistence
  module Relations
    class Distilleries < ROM::Relation[:sql]
      schema(:distilleries, infer: true)
    end
  end
end
