require "high_spirits/email"
require "main/container"

module Main
  class Email < HighSpirits::Email
    configure do |config|
      config.root = Container.root.join("emails")
      config.name = "email"
    end
  end
end
