require 'rails_helper'

RSpec.describe "industrias/new", type: :view do
  before(:each) do
    assign(:industria, build(:industria))
  end

  it "renders new industria form" do
    render

    assert_select "form[action=?][method=?]", industrias_path, "post" do

      assert_select "input[name=?]", "industria[descricao]"

    end
  end
end
