require 'wiz_khilafa/repository'

module Main
  module Persistence
    module Repositories
      class BottlesWhiskies < WizKhilafa::Repository[:bottles_whiskies]
        relations :bottles_whiskies
        commands :create
      end
    end
  end
end
