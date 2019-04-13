require 'rails_helper'

RSpec.describe "representantes/edit", type: :view do

  before(:each) do
    @representante = assign(:representante, create(:representante))
    @cliente = assign(:cliente, @representante.cliente)
  end

  it "renders the edit representante form" do
    render

    assert_select "form[action=?][method=?]", cliente_representante_path(@cliente, @representante), "post" do

      assert_select "input[name=?]", "representante[descricao]"

    end
  end
end
