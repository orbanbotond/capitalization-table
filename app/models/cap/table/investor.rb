module Cap::Table
  class Investor
    include Mongoid::Document
    include Mongoid::Timestamps
    field :name, type: String
    field :amount, type: BigDecimal
    field :willing_to_reinvest, type: Boolean
    field :negotiation_state, type: String

    validates :name, presence: true,
                      uniqueness: true
    validates :amount, presence: true,
                       numericality: true
  end
end
