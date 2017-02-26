ROM::SQL.migration do
  change do
    create_table :blends do
      foreign_key :bottle_id
      Float :total_amount, null: false, default: 0.0
      column :whiskies, :json, null: false, default: '[]'
    end
  end
end
