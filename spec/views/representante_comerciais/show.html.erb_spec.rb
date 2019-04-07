require 'rails_helper'

RSpec.describe "representante_comerciais/show", type: :view do

  before(:each) do
    @representante_comercial = assign(:representante_comercial, create(:representante_comercial, :com_lojistas))
    @lojistas = assign(:lojistas, @representante_comercial.lojistas)
    @cliente = @representante_comercial.cliente
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@representante_comercial.descricao}/)
    assert_select "tr>td", :text => @lojistas.first.descricao
  end
end
