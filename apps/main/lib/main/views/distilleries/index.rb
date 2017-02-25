require 'main/view'
require 'main/import'

module Main
  module Views
    module Distilleries
      class Index < Main::View
        include Main::Import(
          'main.persistence.repositories.distilleries'
        )

        configure do |config|
          config.template = "distilleries/index"
        end

        def locals(options = {})
          super(options).merge(distilleries: distilleries.all)
        end

      end
    end
  end
end
