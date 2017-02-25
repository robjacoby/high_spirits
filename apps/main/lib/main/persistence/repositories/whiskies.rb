require 'wiz_khilafa/repository'

module Main
  module Persistence
    module Repositories
      class Whiskies < WizKhilafa::Repository[:distilleries]
        relations :whiskies
        commands :create
      end
    end
  end
end
