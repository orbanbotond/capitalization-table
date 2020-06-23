module Cap
  module Table
    class Engine < ::Rails::Engine
      isolate_namespace Cap::Table
    end
  end
end
