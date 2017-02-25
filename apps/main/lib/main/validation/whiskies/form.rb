require 'high_spirits/validation'

module Main
  module Validation
    module Whiskies
      Form = HighSpirits::Validation.Form do
        required(:name).maybe(:str?)
        required(:age_statement).maybe(:str?)
        required(:bottled_on).maybe(:date?)
        required(:cask_number).maybe(:str?)
        required(:batch_number).maybe(:str?)
        required(:abv).filled(:float?)
        required(:distillery_id).filled(:int?)

        rule(name_or_age: [:name, :age_statement]) do |name, age_statement|
          name.filled? | age_statement.filled?
        end
      end
    end
  end
end
