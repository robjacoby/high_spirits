require 'main/view'
require 'main/import'

module Main
  module Views
    module Whiskies
      class Index < Main::View
        include Main::Import(
          'main.persistence.repositories.whiskies'
        )

        configure do |config|
          config.template = "whiskies/index"
        end

        def locals(options = {})
          whisky_list = if options[:distillery_id]
                          whiskies.from_distillery(options[:distillery_id])
                        else
                          whiskies.all
                        end

          super(options).merge(whiskies: whisky_list)
        end

      end
    end
  end
end
