module Cap
  module Table
    class Engine < ::Rails::Engine
      isolate_namespace Cap::Table

      config.generators do |generate|
        generate.test_framework  :rspec,
                                 fixtures: true,
                                 view_specs: true,
                                 helper_specs: false,
                                 routing_specs: true,
                                 controller_specs: true,
                                 request_specs: true
      end
    end
  end
end
