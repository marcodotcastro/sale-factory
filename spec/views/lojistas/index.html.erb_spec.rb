require 'rails_helper'

RSpec.describe "lojistas/index", type: :view do

  before(:each) do
    @lojistas = assign(:representante_comerciais, create_list(:lojista, 2))
    @representante_comercial = assign(:representante_comercial, @lojistas.first.representante_comercial)
    @cliente = assign(:cliente, @lojistas.first.representante_comercial.cliente)
  end

  it "renders a list of lojistas" do
    render
    assert_select "tr>td", :text => @lojistas.first.descricao
  end
end
