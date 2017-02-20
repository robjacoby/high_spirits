require_relative "container"

module WizKhilafa
  Import = WizKhilafa::Container.injector

  auto_inject = Dry::AutoInject(WizKhilafa::Container)

  HashImport = -> *keys do
    keys.each do |key|
      unless WizKhilafa::Container.key?(key)
        WizKhilafa::Container.load_component(key)
      end
    end

    auto_inject.hash[*keys]
  end

  def self.Import(*args)
    Import[*args]
  end
end
