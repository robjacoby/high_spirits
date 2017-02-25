require_relative '../../../../component/main/view'

module Main
  module Views
    module Distilleries
      class New < Main::View
        configure do |config|
          config.template = "distilleries/new"
        end

        def locals(options = {})
          super
        end

      end
    end
  end
end
