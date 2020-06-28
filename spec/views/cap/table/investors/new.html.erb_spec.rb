require 'rails_helper'

RSpec.describe "investors/new", type: :view do
  before(:each) do
    assign(:investor, Investor.new(
      name: "MyString",
      amount: "",
      willing_to_reinvest: "",
      negotiation_state: "MyString"
    ))
  end

  it "renders new investor form" do
    render

    assert_select "form[action=?][method=?]", investors_path, "post" do

      assert_select "input[name=?]", "investor[name]"

      assert_select "input[name=?]", "investor[amount]"

      assert_select "input[name=?]", "investor[willing_to_reinvest]"

      assert_select "input[name=?]", "investor[negotiation_state]"
    end
  end
end
