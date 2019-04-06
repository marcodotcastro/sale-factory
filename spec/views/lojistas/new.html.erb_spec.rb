require 'rails_helper'

RSpec.describe "lojistas/new", type: :view do
  before(:each) do
    assign(:lojista, Lojista.new(
      :nome => "MyString",
      :endereco => "MyString",
      :telefone => "MyString",
      :cep => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new lojista form" do
    render

    assert_select "form[action=?][method=?]", lojistas_path, "post" do

      assert_select "input[name=?]", "lojista[nome]"

      assert_select "input[name=?]", "lojista[endereco]"

      assert_select "input[name=?]", "lojista[telefone]"

      assert_select "input[name=?]", "lojista[cep]"

      assert_select "input[name=?]", "lojista[latitude]"

      assert_select "input[name=?]", "lojista[longitude]"
    end
  end
end
