require 'main/import'
require 'main/entities/blended_whisky'
require 'main/entities/blend'
require 'main/validation/blended_whiskies/form'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Blends
      class AddWhisky
        include Main::Import(
          'main.persistence.repositories.blends'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(attributes)
          old_blend  = attributes.delete(:blend)
          validation = Validation::BlendedWhiskies::Form.(attributes)

          if validation.success?
            blended_whisky = Entities::BlendedWhisky.new(validation.output.merge(percentage_of_total: 0.0))
            old_blend.whiskies.push(blended_whisky.to_h)

            blends
              .update(old_blend.bottle_id, whiskies: old_blend.whiskies.map(&:to_h))

            blend = blends.find_by_bottle_id(old_blend.bottle_id)

            Right(blend)
          else
            Left(validation)
          end
        end

      end
    end
  end
end
