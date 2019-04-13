require 'rails_helper'

RSpec.describe "representantes/show", type: :view do

  before(:each) do
    @representante = assign(:representante, create(:representante, :com_lojistas))
    @lojistas = assign(:representantes, @representante.lojistas)
    @cliente = @representante.cliente
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@representante.descricao}/)
    assert_select "tr>td", :text => @lojistas.first.descricao
  end
end
