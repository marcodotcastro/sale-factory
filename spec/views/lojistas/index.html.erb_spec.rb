require 'rails_helper'

RSpec.describe "lojistas/index", type: :view do

  before(:each) do
    @lojistas = assign(:representantes, create_list(:lojista, 2))
    @representante = assign(:representante, @lojistas.first.representante)
    @cliente = assign(:cliente, @lojistas.first.representante.cliente)
  end

  it "renders a list of lojistas" do
    render
    assert_select "tr>td", :text => @lojistas.first.descricao
  end
end
