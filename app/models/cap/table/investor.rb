module Cap::Table
  class Investor
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Multitenancy::Document
    include ::AASM

    field :name, type: String
    field :amount, type: BigDecimal
    field :willing_to_reinvest, type: Boolean
    field :negotiation_state, type: String

    validates :name, presence: true,
                      uniqueness: true
    validates :amount, presence: true,
                       numericality: true

    tenant(:user)

    aasm  column: :negotiation_state do
      state :newly_added, initial: true
      state :pending_legal
      state :invested
      state :reinvesting

      event :negotiate do
        transitions from: [:newly_added, :reinvesting], to: :pending_legal
      end

      event :invest do
        transitions from: :pending_legal, to: :invested
      end

      event :reinvest do
        transitions from: :invested, to: :reinvesting
      end
    end
  end
end
