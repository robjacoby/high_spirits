require_relative "container"

module HighSpirits
  Import = HighSpirits::Container.injector

  auto_inject = Dry::AutoInject(HighSpirits::Container)

  HashImport = -> *keys do
    keys.each do |key|
      unless HighSpirits::Container.key?(key)
        HighSpirits::Container.load_component(key)
      end
    end

    auto_inject.hash[*keys]
  end

  def self.Import(*args)
    Import[*args]
  end
end
