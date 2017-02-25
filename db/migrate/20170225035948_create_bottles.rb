ROM::SQL.migration do
  up do
    create_table :bottles do
      primary_key :id
      String :name
      Integer :volume, null: false, default: 0
      DateTime :created_at, null: false, default: Sequel.lit("(now() at time zone 'utc')")
      DateTime :updated_at, null: false,  default: Sequel.lit("(now() at time zone 'utc')")
    end

    run <<-SQL
      CREATE TRIGGER set_updated_at_on_bottles
        BEFORE UPDATE ON bottles FOR EACH ROW
        EXECUTE PROCEDURE set_updated_at_column();
    SQL
  end

  down do
    run <<-SQL
      DROP TRIGGER IF EXISTS set_updated_at_on_bottles ON bottles;
    SQL

    drop_table :bottles
  end
end
