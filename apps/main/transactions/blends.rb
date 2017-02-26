require "main/transactions"

Main::Transactions.define do |t|
  t.define 'main.transactions.add_whisky_to_blend' do
    step :find_or_create, with: 'main.operations.blends.find_or_create'
    step :add_whisky, with: 'main.operations.blends.add_whisky'
    step :recalculate, with: 'main.operations.blends.recalculate'
  end
end
