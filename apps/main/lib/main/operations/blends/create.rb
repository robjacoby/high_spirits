require 'main/import'
require 'main/entities/blend'
require 'main/validation/blends/schema'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Blends
      class Create
        include Main::Import(
          'main.persistence.repositories.blends'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(bottle_id)
          validation = Validation::Blends::Schema.(bottle_id: bottle_id, total_amount: 0)

          if validation.success?
            blend = Entities::Blend.new(blends.create(validation.output))

            Right(blend)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
