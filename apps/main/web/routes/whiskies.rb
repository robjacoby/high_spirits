module Main
  class Application
    route "whiskies" do |r|

      r.get do
        r.view 'whiskies.index'
      end

      r.post do
        r.resolve 'main.operations.whiskies.create' do |create|
          create.(r[:whisky]) do |m|
            m.success do
              r.redirect '/whiskies'
            end

            m.failure do |validation|
              r.view 'whiskies.new', validation: validation
            end
          end
        end
      end

      r.get 'new' do
        r.view 'whiskies.new'
      end

    end
  end
end
