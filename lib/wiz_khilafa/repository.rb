require "rom-repository"
require "wiz_khilafa/container"
require "wiz_khilafa/import"

WizKhilafa::Container.boot! :rom

module WizKhilafa
  class Repository < ROM::Repository::Root
    include WizKhilafa::Import.args["persistence.rom"]
  end
end
