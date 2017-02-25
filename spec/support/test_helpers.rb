module TestHelpers
  module_function

  def container
    HighSpirits::Container
  end

  def app
    HighSpirits::Application.app
  end

  def rom
    container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
