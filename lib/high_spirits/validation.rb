require 'dry-validation'

module HighSpirits
  module Validation
    class Form < Dry::Validation::Schema::Form
      configure do |config|
        config.messages = :i18n
      end
    end

    class Schema < Dry::Validation::Schema
      configure do |config|
        config.messages = :i18n
      end
    end

    def self.Form(&block)
      Dry::Validation.Schema(Form, &block)
    end

    def self.Schema(&block)
      Dry::Validation.Schema(Schema, &block)
    end
  end
end
