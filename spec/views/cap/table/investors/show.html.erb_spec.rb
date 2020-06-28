require 'rails_helper'

RSpec.describe "investors/show", type: :view do
  before(:each) do
    @investor = assign(:investor, Investor.create!(
      name: "Name",
      amount: "",
      willing_to_reinvest: "",
      negotiation_state: "Negotiation State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Negotiation State/)
  end
end
