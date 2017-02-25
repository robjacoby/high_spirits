require 'high_spirits/repository'

module Main
  module Persistence
    module Repositories
      class Bottles < HighSpirits::Repository[:bottles]
        relations :bottles
        commands :create
      end
    end
  end
end
