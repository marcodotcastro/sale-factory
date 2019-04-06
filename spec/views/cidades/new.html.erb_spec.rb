require 'rails_helper'

RSpec.describe "cidades/new", type: :view do
  before(:each) do
    assign(:cidade, Cidade.new(
      :descricao => "MyString",
      :estado => "MyString",
      :populacao => 1,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new cidade form" do
    render

    assert_select "form[action=?][method=?]", cidades_path, "post" do

      assert_select "input[name=?]", "cidade[descricao]"

      assert_select "input[name=?]", "cidade[estado]"

      assert_select "input[name=?]", "cidade[populacao]"

      assert_select "input[name=?]", "cidade[latitude]"

      assert_select "input[name=?]", "cidade[longitude]"
    end
  end
end
