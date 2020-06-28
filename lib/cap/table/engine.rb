require 'bootstrap'
require 'aasm'

module Cap
  module Table
    class Engine < ::Rails::Engine
      isolate_namespace Cap::Table

      config.generators do |generate|
        generate.test_framework  :rspec,
                                 fixtures: true,
                                 view_specs: true,
                                 helper_specs: false,
                                 routing_specs: false,
                                 controller_specs: false,
                                 request_specs: false
      end
    end
  end
end
