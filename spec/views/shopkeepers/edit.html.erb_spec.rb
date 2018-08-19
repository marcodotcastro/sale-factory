require 'rails_helper'

RSpec.describe "shopkeepers/edit", type: :view do
  before(:each) do
    @shopkeeper = assign(:shopkeeper, Shopkeeper.create!(
      :name => "MyString",
      :address => "MyString",
      :state => "MyString",
      :city => "MyString",
      :phone => "MyString",
      :cep => "MyString",
      :latitude => "MyString",
      :longitude => "MyString"
    ))
  end

  it "renders the edit shopkeeper form" do
    render

    assert_select "form[action=?][method=?]", shopkeeper_path(@shopkeeper), "post" do

      assert_select "input[name=?]", "shopkeeper[name]"

      assert_select "input[name=?]", "shopkeeper[address]"

      assert_select "input[name=?]", "shopkeeper[state]"

      assert_select "input[name=?]", "shopkeeper[city]"

      assert_select "input[name=?]", "shopkeeper[phone]"

      assert_select "input[name=?]", "shopkeeper[cep]"

      assert_select "input[name=?]", "shopkeeper[latitude]"

      assert_select "input[name=?]", "shopkeeper[longitude]"
    end
  end
end
