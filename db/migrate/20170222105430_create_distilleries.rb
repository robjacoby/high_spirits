ROM::SQL.migration do
  up do
    create_table :distilleries do
      primary_key :id
      String :name, null: false
      String :location, null: false
      String :region, null: false
      String :owned_by
      DateTime :created_at, null: false, default: Sequel.lit("(now() at time zone 'utc')")
      DateTime :updated_at, null: false,  default: Sequel.lit("(now() at time zone 'utc')")
    end

    run <<-SQL
      CREATE TRIGGER set_updated_at_on_distilleries
        BEFORE UPDATE ON distilleries FOR EACH ROW
        EXECUTE PROCEDURE set_updated_at_column();
    SQL
  end

  down do
    run <<-SQL
      DROP TRIGGER IF EXISTS set_updated_at_on_distilleries ON distilleries;
    SQL

    drop_table :distilleries
  end
end
