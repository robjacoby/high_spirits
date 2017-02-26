require 'main/import'
require 'main/entities/measure'
require 'main/validation/measures/form'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Measures
      class ValidateMeasure
        include Main::Import(
          'main.operations.events.create'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(attributes)
          validation = Validation::Measures::Form.(attributes)

          if validation.success?
            Right(type: 'AddWhiskyToBottle', body: validation.output)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
