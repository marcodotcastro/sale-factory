require 'rails_helper'

RSpec.describe "lojistas/show", type: :view do
  before(:each) do
    @lojista = assign(:lojista, create(:lojista))
    @representante = assign(:representante, @lojista.representante)
    @cliente = assign(:cliente, @lojista.representante.cliente)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@lojista.descricao}/)
  end
end
