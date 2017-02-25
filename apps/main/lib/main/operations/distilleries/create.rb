require 'main/import'
require 'main/entities/distillery'
require 'main/validation/distilleries/form'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Distilleries
      class Create
        include Main::Import(
          'main.persistence.repositories.distilleries'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(attributes)
          validation = Validation::Distilleries::Form.(attributes)

          if validation.success?
            distillery = Entities::Distillery.new(distilleries.create(validation.output))

            Right(distillery)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
