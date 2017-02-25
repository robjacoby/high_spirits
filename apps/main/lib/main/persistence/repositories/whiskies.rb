require 'high_spirits/repository'
require 'main/entities/whisky'

module Main
  module Persistence
    module Repositories
      class Whiskies < HighSpirits::Repository[:whiskies]
        relations :whiskies
        commands :create

        def from_distillery(distillery_id)
          where(distillery_id: distillery_id)
            .as(Entities::Whisky)
            .to_a
        end

        def all
          whiskies
            .as(Entities::Whisky)
            .to_a
        end
      end
    end
  end
end
