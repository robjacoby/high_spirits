ROM::SQL.migration do
  change do
    WizKhilafa::Container.boot! :que
    Que.migrate!
  end
end
