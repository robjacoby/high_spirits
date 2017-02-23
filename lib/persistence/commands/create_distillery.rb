module Persistence
  module Commands
    class CreateDistillery < ROM::Commands::Create[:sql]
      relation :distilleries
      register_as :create
      result :one

      def execute(tuple)
        result = super

        post_id = result.first[:id]

        if tuple[:categories]
          categories = tuple[:categories].product([post_id])

          post_tuples = categories.map { |new_category_id, new_post_id|
            {
              category_id: new_category_id,
              post_id: new_post_id
            }
          }

          categorisations.multi_insert(post_tuples)
        end

        result
      end

      private

      def categorisations
        relation.categorisations
      end
    end
  end
end
