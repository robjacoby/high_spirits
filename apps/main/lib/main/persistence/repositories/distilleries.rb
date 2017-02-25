require 'high_spirits/repository'
require 'main/entities/distillery'

module Main
  module Persistence
    module Repositories
      class Distilleries < HighSpirits::Repository[:distilleries]
        relations :distilleries
        commands :create

        def all
          distilleries.as(Entities::Distillery)
        end
      end
    end
  end
end
