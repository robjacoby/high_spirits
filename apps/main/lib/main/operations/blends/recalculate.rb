require 'main/import'
require 'main/entities/blend'
require 'main/validation/blended_whiskies/form'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Blends
      class Recalculate
        include Main::Import(
          'main.persistence.repositories.blends'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(old_blend)
          total_amount = old_blend.whiskies.map(&:volume).inject(0, :+).to_f
          whiskies     = old_blend.whiskies.map do |whisky|
            Entities::BlendedWhisky.new(
              whisky_id:           whisky.whisky_id,
              volume:              whisky.volume,
              percentage_of_total: whisky.volume / total_amount
            )
          end

          updated_blend = Entities::Blend.new(
            bottle_id:    old_blend.bottle_id,
            total_amount: total_amount,
            whiskies:     whiskies
          )

          blends
            .update(updated_blend.bottle_id, updated_blend)

          blend = blends.find_by_bottle_id(updated_blend.bottle_id)

          if blend
            Right(blend)
          else
            Left("Couldn't update blend")
          end

        end

      end
    end
  end
end
