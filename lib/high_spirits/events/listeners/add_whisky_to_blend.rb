require 'main/import'
require 'types'

module HighSpirits
  module Events
    module Listeners
      class AddWhiskyToBlend
        include Main::Import(
          'main.persistence.repositories.events',
          'main.transactions.add_whisky_to_blend'
        )

        attr_reader :bookmark

        def call
          @bookmark ||= 1
          while true
            events.get_next_from(bookmark + 1).each do |event|
              puts "Adding Whisky To Blend"
              attrs = Types::SymbolizedHash[event.body]
              add_whisky_to_blend.(attrs)
              @bookmark = event.sequence
            end

            sleep 1
          end
        end
      end
    end
  end
end
