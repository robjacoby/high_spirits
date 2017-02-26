require "main/transactions"

Main::Transactions.define do |t|
  t.define 'main.transactions.add_whisky_to_bottle' do
    step :validate_measure, with: 'main.operations.measures.validate_measure'
    step :create, with: 'main.operations.events.create'
  end
end
