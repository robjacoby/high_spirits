ROM::SQL.migration do
  change do
    create_table :distilleries do
      primary_key :id
      String :name, null: false
      String :location, null: false
      String :region, null: false
      String :owned_by
    end
  end
end
