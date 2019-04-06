require 'rails_helper'

RSpec.describe "lojistas/edit", type: :view do
  before(:each) do
    @lojista = assign(:lojista, Lojista.create!(
      :nome => "MyString",
      :endereco => "MyString",
      :telefone => "MyString",
      :cep => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit lojista form" do
    render

    assert_select "form[action=?][method=?]", lojista_path(@lojista), "post" do

      assert_select "input[name=?]", "lojista[nome]"

      assert_select "input[name=?]", "lojista[endereco]"

      assert_select "input[name=?]", "lojista[telefone]"

      assert_select "input[name=?]", "lojista[cep]"

      assert_select "input[name=?]", "lojista[latitude]"

      assert_select "input[name=?]", "lojista[longitude]"
    end
  end
end
