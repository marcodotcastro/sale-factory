require 'rails_helper'

RSpec.describe "clientes/edit", type: :view do
  before(:each) do
    @cliente = assign(:cliente, create(:cliente))
  end

  it "renders the edit cliente form" do
    render

    assert_select "form[action=?][method=?]", cliente_path(@cliente), "post" do

      assert_select "input[name=?]", "cliente[descricao]"

    end
  end
end
