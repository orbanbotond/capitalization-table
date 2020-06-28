require 'rails_helper'

RSpec.describe "investors/index", type: :view do
  before(:each) do
    assign(:investors, [
      Investor.create!(
        name: "Name",
        amount: "",
        willing_to_reinvest: "",
        negotiation_state: "Negotiation State"
      ),
      Investor.create!(
        name: "Name",
        amount: "",
        willing_to_reinvest: "",
        negotiation_state: "Negotiation State"
      )
    ])
  end

  it "renders a list of investors" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Negotiation State".to_s, count: 2
  end
end
