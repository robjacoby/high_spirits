ROM::SQL.migration do
  up do
    create_table :bottles_whiskies do
      foreign_key :bottle_id
      foreign_key :whisky_id
      Integer :volume, null: false, default: 0
      DateTime :created_at, null: false, default: Sequel.lit("(now() at time zone 'utc')")
      DateTime :updated_at, null: false,  default: Sequel.lit("(now() at time zone 'utc')")
    end

    run <<-SQL
      CREATE TRIGGER set_updated_at_on_bottles_whiskies
        BEFORE UPDATE ON bottles_whiskies FOR EACH ROW
        EXECUTE PROCEDURE set_updated_at_column();
    SQL
  end

  down do
    run <<-SQL
      DROP TRIGGER IF EXISTS set_updated_at_on_bottles_whiskies ON bottles_whiskies;
    SQL

    drop_table :bottles_whiskies
  end
end
