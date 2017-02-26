require 'high_spirits/validation'

module Main
  module Validation
    module Events
      Schema = HighSpirits::Validation.Schema do
        required(:type).filled(:str?)
        required(:body).filled(:hash?)
      end
    end
  end
end
