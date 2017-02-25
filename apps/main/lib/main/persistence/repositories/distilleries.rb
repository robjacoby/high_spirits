require 'wiz_khilafa/repository'

module Main
  module Persistence
    module Repositories
      class Distilleries < WizKhilafa::Repository[:distilleries]
        relations :distilleries
        commands :create
      end
    end
  end
end
