require 'rails_helper'

RSpec.describe "investors/edit", type: :view do
  before(:each) do
    @investor = assign(:investor, Investor.create!(
      name: "MyString",
      amount: "",
      willing_to_reinvest: "",
      negotiation_state: "MyString"
    ))
  end

  it "renders the edit investor form" do
    render

    assert_select "form[action=?][method=?]", investor_path(@investor), "post" do

      assert_select "input[name=?]", "investor[name]"

      assert_select "input[name=?]", "investor[amount]"

      assert_select "input[name=?]", "investor[willing_to_reinvest]"

      assert_select "input[name=?]", "investor[negotiation_state]"
    end
  end
end
