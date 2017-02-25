require 'high_spirits/repository'

module Main
  module Persistence
    module Repositories
      class Distilleries < HighSpirits::Repository[:distilleries]
        relations :distilleries
        commands :create
      end
    end
  end
end
