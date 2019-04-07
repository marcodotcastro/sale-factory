require 'rails_helper'

RSpec.describe "lojistas/show", type: :view do
  before(:each) do
    @lojista = assign(:lojista, create(:lojista))
    @representante_comercial = assign(:representante_comercial, @lojista.representante_comercial)
    @cliente = assign(:cliente, @lojista.representante_comercial.cliente)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@lojista.descricao}/)
  end
end
