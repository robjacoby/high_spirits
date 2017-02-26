require 'main/import'
require 'main/entities/blend'
require 'dry-result_matcher'
require 'dry-monads'

module Main
  module Operations
    module Blends
      class FindOrCreate
        include Main::Import(
          'main.persistence.repositories.blends',
          'main.operations.blends.create'
        )

        include Dry::ResultMatcher.for(:call)
        include Dry::Monads::Either::Mixin

        def call(attributes)
          bottle_id = attributes.delete(:bottle_id)
          if blend = blends.find_by_bottle_id(bottle_id)
            Right(attributes.merge(blend: blend))
          else
            create.(bottle_id) do |m|
              m.success do |result|
                return Right(attributes.merge(blend: result))
              end

              m.failure do |result|
                return Left(result)
              end
            end
          end
        end

      end
    end
  end
end
