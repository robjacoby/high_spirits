require 'main/import'
require 'main/entities/event'
require 'main/validation/events/schema'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Events
      class Create
        include Main::Import(
          'main.persistence.repositories.events'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(attributes)
          validation = Validation::Events::Schema.(attributes)

          if validation.success?
            event = Entities::Event.new(events.create(validation.output))

            Right(event)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
