require 'rails_helper'

RSpec.describe "clientes/new", type: :view do
  before(:each) do
    assign(:cliente, Cliente.new(
      :descricao => "MyString",
      :contato => "MyString",
      :endereco => "MyString",
      :cep => "MyString",
      :telefone => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new cliente form" do
    render

    assert_select "form[action=?][method=?]", clientes_path, "post" do

      assert_select "input[name=?]", "cliente[descricao]"

      assert_select "input[name=?]", "cliente[contato]"

      assert_select "input[name=?]", "cliente[endereco]"

      assert_select "input[name=?]", "cliente[cep]"

      assert_select "input[name=?]", "cliente[telefone]"

      assert_select "input[name=?]", "cliente[latitude]"

      assert_select "input[name=?]", "cliente[longitude]"
    end
  end
end
