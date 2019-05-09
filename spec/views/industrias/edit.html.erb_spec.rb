require 'rails_helper'

RSpec.describe "industrias/edit", type: :view do
  before(:each) do
    @industria = assign(:industria, create(:industria))
  end

  it "renders the edit industria form" do
    render

    assert_select "form[action=?][method=?]", industria_path(@industria), "post" do

      assert_select "input[name=?]", "industria[descricao]"

    end
  end
end
