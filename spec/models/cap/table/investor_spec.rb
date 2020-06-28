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

    describe 'states' do
      describe 'negotiation_state' do
        context 'when created' do
          it { should be_newly_added }
        end
        describe 'state transitions' do
          subject(:investor) { ::Cap::Table::Investor.new }

          specify 'moving through all the states' do
            expect(investor).to be_newly_added
            investor.negotiate
            expect(investor).to be_pending_legal
            investor.invest
            expect(investor).to be_invested
            investor.reinvest
            expect(investor).to be_reinvesting
            investor.negotiate
            expect(investor).to be_pending_legal
          end
        end
      end
    end
  end
end
