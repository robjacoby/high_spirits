require 'wiz_khilafa/repository'

module Main
  module Persistence
    module Repositories
      class Bottles < WizKhilafa::Repository[:bottles]
        relations :bottles
        commands :create
      end
    end
  end
end
