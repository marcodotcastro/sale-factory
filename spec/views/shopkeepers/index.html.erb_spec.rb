require 'rails_helper'

RSpec.describe "shopkeepers/index", type: :view do
  before(:each) do
    assign(:shopkeepers, [
      Shopkeeper.create!(
        :name => "Name",
        :address => "Address",
        :state => "State",
        :city => "City",
        :phone => "Phone",
        :cep => "Cep",
        :latitude => "Latitude",
        :longitude => "Longitude"
      ),
      Shopkeeper.create!(
        :name => "Name",
        :address => "Address",
        :state => "State",
        :city => "City",
        :phone => "Phone",
        :cep => "Cep",
        :latitude => "Latitude",
        :longitude => "Longitude"
      )
    ])
  end

  it "renders a list of shopkeepers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
  end
end
