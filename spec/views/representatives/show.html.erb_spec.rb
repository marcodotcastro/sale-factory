require 'rails_helper'

RSpec.describe "representatives/show", type: :view do
  before(:each) do
    @representative = assign(:representative, Representative.create!(
      :description => "Description",
      :contact => "Contact",
      :address => "Address",
      :cep => "Cep",
      :phone => "Phone",
      :email => "Email",
      :latitude => 2.5,
      :longitude => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
