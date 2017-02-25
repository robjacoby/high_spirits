require 'high_spirits/validation'

module Main
  module Validation
    module Distilleries
      Form = HighSpirits::Validation.Form do
        required(:name).filled(:str?)
        required(:location).filled(:str?)
        required(:region).filled(:str?)
        optional(:owned_by).filled(:str?)
      end
    end
  end
end
