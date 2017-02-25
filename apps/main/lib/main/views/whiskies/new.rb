require 'main/view'

module Main
  module Views
    module Whiskies
      class New < Main::View
        configure do |config|
          config.template = "whiskies/new"
        end

        def locals(options = {})
          super
        end

      end
    end
  end
end
