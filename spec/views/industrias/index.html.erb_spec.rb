require 'rails_helper'

RSpec.describe "industrias/index", type: :view do

  before(:each) do
    @industrias = assign(:industrias, create_list(:industria, 2))
  end

  it "renders a list of industrias" do
    render
    assert_select "tr>td", :text => @industrias.first.descricao
  end
end
