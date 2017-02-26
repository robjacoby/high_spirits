require 'high_spirits/repository'
require 'main/entities/blend'

module Main
  module Persistence
    module Repositories
      class Blends < HighSpirits::Repository[:blends]
        relations :blends
        commands :create, update: [:by_bottle_id]

        def find_by_bottle_id(bottle_id)
          blends.where(bottle_id: bottle_id).as(Entities::Blend).one
        end

        def all
          blends
            .as(Entities::Blend)
            .to_a
        end
      end
    end
  end
end
