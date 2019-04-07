require 'rails_helper'

RSpec.describe "lojistas/edit", type: :view do

  before(:each) do
    @lojista = assign(:lojista, create(:lojista))
    @representante_comercial = assign(:representante_comercial, @lojista.representante_comercial)
    @cliente = assign(:cliente, @lojista.representante_comercial.cliente)
  end

  it "renders the edit lojista form" do
    render

    assert_select "form[action=?][method=?]", cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista), "post" do

      assert_select "input[name=?]", "lojista[descricao]"

    end
  end
end
