require 'rails_helper'

RSpec.describe "clientes/index", type: :view do

  before(:each) do
    @clientes = assign(:clientes, create_list(:cliente, 2))
  end

  it "renders a list of clientes" do
    render
    assert_select "tr>td", :text => @clientes.first.descricao
  end
end
