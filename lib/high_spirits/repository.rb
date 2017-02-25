require "rom-repository"
require "high_spirits/container"
require "high_spirits/import"

HighSpirits::Container.boot! :rom

module HighSpirits
  class Repository < ROM::Repository::Root
    include HighSpirits::Import.args["persistence.rom"]
  end
end
