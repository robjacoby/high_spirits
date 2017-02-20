require "dry-transaction"
require "dry-monads"

require "wiz_khilafa/transactions"
require "main/container"
require "main/import"

module Main
  class Transactions < WizKhilafa::Transactions
    class StepAdapters < Dry::Transaction::StepAdapters
      class Enqueue
        include Main::Import("enqueue")
        include Dry::Monads::Either::Mixin

        def call(step, *args, input)
          enqueue.(step.operation_name, *args, input)
          Right(input)
        end
      end

      register :enqueue, Enqueue.new
    end

    configure do |config|
      config.container = Main::Container
      config.options = {step_adapters: StepAdapters}
    end
  end
end
