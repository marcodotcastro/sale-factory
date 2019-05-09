require 'rails_helper'

RSpec.describe "lojistas/show", type: :view do
  before(:each) do
    @lojista = assign(:lojista, create(:lojista))
    @representante = assign(:representante, @lojista.representante)
    @industria = assign(:industria, @lojista.representante.industria)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@lojista.descricao}/)
  end
end
