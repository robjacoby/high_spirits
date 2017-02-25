ROM::SQL.migration do
  up do
    create_table :whiskies do
      primary_key :id
      String :name
      Integer :age_statement
      Date :bottled_on
      String :cask_number
      String :batch_number
      Float :abv, null: false
      foreign_key :distillery_id
      DateTime :created_at, null: false, default: Sequel.lit("(now() at time zone 'utc')")
      DateTime :updated_at, null: false,  default: Sequel.lit("(now() at time zone 'utc')")
    end

    run <<-SQL
      CREATE TRIGGER set_updated_at_on_whiskies
        BEFORE UPDATE ON whiskies FOR EACH ROW
        EXECUTE PROCEDURE set_updated_at_column();
    SQL
  end

  down do
    run <<-SQL
      DROP TRIGGER IF EXISTS set_updated_at_on_whiskies ON whiskies;
    SQL

    drop_table :whiskies
  end
end
