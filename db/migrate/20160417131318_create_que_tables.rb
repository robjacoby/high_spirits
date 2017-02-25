ROM::SQL.migration do
  change do
    HighSpirits::Container.boot! :que
    Que.migrate!
  end
end
