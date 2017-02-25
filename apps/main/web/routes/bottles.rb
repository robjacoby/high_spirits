module Main
  class Application
    route "bottles" do |r|

      r.is do
        r.view 'bottles.index'
      end

      r.post do
        r.resolve 'main.operations.bottles.create' do |create|
          create.(r[:whisky]) do |m|
            m.success do
              r.redirect '/bottles'
            end

            m.failure do |validation|
              r.view 'bottles.new', validation: validation
            end
          end
        end
      end

      r.get 'new' do
        r.view 'bottles.new'
      end

    end
  end
end
