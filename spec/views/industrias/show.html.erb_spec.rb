require 'rails_helper'

RSpec.describe "industrias/show", type: :view do

  before(:each) do
    @industria = assign(:industria, create(:industria, :com_representantes))
    @representantes = assign(:representantes, @industria.representantes)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@industria.descricao}/)
    assert_select "tr>td", :text => @representantes.first.descricao
  end
end
