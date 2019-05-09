require 'rails_helper'

RSpec.describe "representantes/new", type: :view do

  before(:each) do
    @representante = assign(:representante, create(:representante))
    @industria = assign(:industria, @representante.industria)
  end

  it "renders new representante form" do
    render

    assert_select "form[action=?][method=?]", industria_representante_path(@industria, @representante), "post" do

      assert_select "input[name=?]", "representante[descricao]"

    end
  end
end
