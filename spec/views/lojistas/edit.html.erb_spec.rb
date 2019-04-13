require 'rails_helper'

RSpec.describe "lojistas/edit", type: :view do

  before(:each) do
    @lojista = assign(:lojista, create(:lojista))
    @representante = assign(:representante, @lojista.representante)
    @cliente = assign(:cliente, @lojista.representante.cliente)
  end

  it "renders the edit lojista form" do
    render

    assert_select "form[action=?][method=?]", cliente_representante_lojista_path(@cliente, @representante, @lojista), "post" do

      assert_select "input[name=?]", "lojista[descricao]"

    end
  end
end
