distilleries = [
  {
    name: 'Glenlivet',
    location: 'Scotland',
    region: 'Highland',
    owned_by: ''
  }
]

distilleries.each do |distillery|
  Main::Container['main.persistence.repositories.distilleries'].create(distillery)
end
