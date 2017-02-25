module Main
  class Application
    route "distilleries" do |r|

      r.is do
        r.view 'distilleries.index'
      end

      r.post do
        r.resolve 'main.operations.distilleries.create' do |create|
          create.(r[:distillery]) do |m|
            m.success do
              r.redirect '/distilleries'
            end

            m.failure do |validation|
              r.view 'distilleries.new', validation: validation
            end
          end
        end
      end

      r.get 'new' do
        r.view 'distilleries.new'
      end

    end
  end
end
