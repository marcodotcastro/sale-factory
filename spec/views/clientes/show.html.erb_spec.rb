require 'rails_helper'

RSpec.describe "clientes/show", type: :view do

  before(:each) do
    @cliente = assign(:cliente, create(:cliente, :com_representante_comerciais))
    @representante_comerciais = assign(:representante_comerciais, @cliente.representante_comerciais)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@cliente.descricao}/)
    assert_select "tr>td", :text => @representante_comerciais.first.descricao
  end
end
