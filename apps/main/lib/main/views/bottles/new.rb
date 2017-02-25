require 'main/view'

module Main
  module Views
    module Bottles
      class New < Main::View
        configure do |config|
          config.template = "bottles/new"
        end

        def locals(options = {})
          super
        end

      end
    end
  end
end
