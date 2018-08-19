require 'rails_helper'

RSpec.describe "representatives/new", type: :view do
  before(:each) do
    assign(:representative, Representative.new(
      :description => "MyString",
      :contact => "MyString",
      :address => "MyString",
      :cep => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new representative form" do
    render

    assert_select "form[action=?][method=?]", representatives_path, "post" do

      assert_select "input[name=?]", "representative[description]"

      assert_select "input[name=?]", "representative[contact]"

      assert_select "input[name=?]", "representative[address]"

      assert_select "input[name=?]", "representative[cep]"

      assert_select "input[name=?]", "representative[phone]"

      assert_select "input[name=?]", "representative[email]"

      assert_select "input[name=?]", "representative[latitude]"

      assert_select "input[name=?]", "representative[longitude]"
    end
  end
end
