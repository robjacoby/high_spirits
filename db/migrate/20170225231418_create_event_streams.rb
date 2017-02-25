ROM::SQL.migration do
  change do
    create_table :event_streams do
      String :data, null: false, default: '{}'
      DateTime :created_at, null: false, default: Sequel.lit("(now() at time zone 'utc')")
    end
  end
end
