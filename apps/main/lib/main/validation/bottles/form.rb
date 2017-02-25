require 'high_spirits/validation'

module Main
  module Validation
    module Bottles
      Form = HighSpirits::Validation.Form do
        required(:name).filled(:str?)
        required(:volume).filled(:int?)
      end
    end
  end
end
