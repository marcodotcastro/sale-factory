require 'rails_helper'

RSpec.describe "shopkeepers/show", type: :view do
  before(:each) do
    @shopkeeper = assign(:shopkeeper, Shopkeeper.create!(
      :name => "Name",
      :address => "Address",
      :state => "State",
      :city => "City",
      :phone => "Phone",
      :cep => "Cep",
      :latitude => "Latitude",
      :longitude => "Longitude"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
  end
end
