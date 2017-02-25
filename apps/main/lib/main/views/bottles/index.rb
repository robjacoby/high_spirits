require 'main/view'
require 'main/import'

module Main
  module Views
    module Bottles
      class Index < Main::View
        include Main::Import(
          'main.persistence.repositories.bottles'
        )

        configure do |config|
          config.template = "bottles/index"
        end

        def locals(options = {})
          super(options).merge(bottles: bottles.all)
        end

      end
    end
  end
end
