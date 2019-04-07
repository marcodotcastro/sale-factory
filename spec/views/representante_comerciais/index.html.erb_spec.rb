require 'rails_helper'

RSpec.describe "representante_comerciais/index", type: :view do

  before(:each) do
    @cliente = assign(:cliente, create(:cliente))
    @representante_comerciais = assign(:representante_comerciais, create_list(:representante_comercial, 2))
  end

  it "renders a list of representante_comerciais" do
    render
    assert_select "tr>td", :text => @representante_comerciais.first.descricao
  end
end
