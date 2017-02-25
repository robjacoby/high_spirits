require 'main/import'
require 'main/entities/bottle'
require 'main/validation/bottles/form'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Bottles
      class Create
        include Main::Import(
          'main.persistence.repositories.bottles'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(attributes)
          validation = Validation::Bottles::Form.(attributes)

          if validation.success?
            bottle = Entities::Bottle.new(bottles.create(validation.output))

            Right(bottle)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
