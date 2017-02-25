ROM::SQL.migration do
  change do
    create_table :whiskies do
      primary_key :id
      String :name
      String :age_statement
      Integer :year_released
      Integer :cask_number
      Integer :batch_number
      Float :abv
      foreign_key :distillery_id
    end
  end
end
