module TestHelpers
  module_function

  def container
    WizKhilafa::Container
  end

  def app
    WizKhilafa::Application.app
  end

  def rom
    container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
