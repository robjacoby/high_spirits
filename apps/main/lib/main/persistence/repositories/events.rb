require 'high_spirits/repository'
require 'main/entities/event'

module Main
  module Persistence
    module Repositories
      class Events < HighSpirits::Repository[:events]
        relations :events
        commands :create

        def get_next_from(sequence, event_types: nil, limit: 1000)
          query = events
                    .order(:sequence)
                    .where('sequence >= :from_sequence', from_sequence: sequence)
                    .limit(limit)

          if event_types
            query = query.where(type: event_types)
          end

          query
            .as(Entities::Event)
            .to_a
        end
      end
    end
  end
end
