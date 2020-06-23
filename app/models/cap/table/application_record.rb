module Cap
  module Table
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
