require 'high_spirits/repository'
require 'main/entities/bottle'

module Main
  module Persistence
    module Repositories
      class Bottles < HighSpirits::Repository[:bottles]
        relations :bottles
        commands :create

        def find(id)
          bottles.where(id: id).as(Entities::Bottle).one
        end

        def all
          bottles
            .as(Entities::Bottle)
            .to_a
        end
      end
    end
  end
end
