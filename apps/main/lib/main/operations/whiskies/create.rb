require 'main/import'
require 'main/entities/whisky'
require 'main/validation/whisky/form'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Whiskies
      class Create
        include Main::Import(
          'main.persistence.repositories.whiskies'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(attributes)
          validation = Validation::Whiskies::Form.(attributes)

          if validation.success?
            whisky = Entities::Whisky.new(whiskies.create(validation.output))

            Right(whisky)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
