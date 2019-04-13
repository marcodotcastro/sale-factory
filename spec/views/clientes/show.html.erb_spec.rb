require 'rails_helper'

RSpec.describe "clientes/show", type: :view do

  before(:each) do
    @cliente = assign(:cliente, create(:cliente, :com_representantes))
    @representantes = assign(:representantes, @cliente.representantes)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@cliente.descricao}/)
    assert_select "tr>td", :text => @representantes.first.descricao
  end
end
