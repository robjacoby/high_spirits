ROM::SQL.migration do
  change do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
    create_table :events do
      primary_key :sequence, type: :Bignum
      column :id, 'uuid default uuid_generate_v4() not null'
      String :type, null: false
      column :body, 'json not null'
      DateTime :created_at, null: false, default: Sequel.lit("(now() at time zone 'utc')")
    end
  end
end
