require 'rails_helper'

RSpec.describe "representantes/index", type: :view do

  before(:each) do
    @industria = assign(:industria, create(:industria))
    @representantes = assign(:representantes, create_list(:representante, 2))
  end

  it "renders a list of representantes" do
    render
    assert_select "tr>td", :text => @representantes.first.descricao
  end
end
