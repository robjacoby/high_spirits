require 'high_spirits/repository'

module Main
  module Persistence
    module Repositories
      class BottlesWhiskies < HighSpirits::Repository[:bottles_whiskies]
        relations :bottles_whiskies
        commands :create
      end
    end
  end
end
