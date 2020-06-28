require 'rails_helper'

module Cap::Table
  RSpec.describe Investor, type: :model do
    describe 'validations' do
      describe 'name' do
        it { should validate_presence_of(:name) }
        it { should validate_uniqueness_of(:name) }
      end
      describe 'amount' do
        it { should validate_presence_of(:amount) }
      end
    end

  end
end
