require 'rails_helper'

RSpec.describe "representatives/index", type: :view do
  before(:each) do
    assign(:representatives, [
      Representative.create!(
        :description => "Description",
        :contact => "Contact",
        :address => "Address",
        :cep => "Cep",
        :phone => "Phone",
        :email => "Email",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      Representative.create!(
        :description => "Description",
        :contact => "Contact",
        :address => "Address",
        :cep => "Cep",
        :phone => "Phone",
        :email => "Email",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of representatives" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
