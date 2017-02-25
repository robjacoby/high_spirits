require 'high_spirits/repository'

module Main
  module Persistence
    module Repositories
      class Whiskies < HighSpirits::Repository[:whiskies]
        relations :whiskies
        commands :create

        def from_distillery(distillery_id)
          where(distillery_id: distillery_id)
        end
      end
    end
  end
end
