require 'rails_helper'

RSpec.describe "representante_comerciais/edit", type: :view do

  before(:each) do
    @representante_comercial = assign(:representante_comercial, create(:representante_comercial))
    @cliente = assign(:cliente, @representante_comercial.cliente)
  end

  it "renders the edit representante_comercial form" do
    render

    assert_select "form[action=?][method=?]", cliente_representante_comercial_path(@cliente, @representante_comercial), "post" do

      assert_select "input[name=?]", "representante_comercial[descricao]"

    end
  end
end
