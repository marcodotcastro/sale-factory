require 'rails_helper'

RSpec.describe "clientes/edit", type: :view do
  before(:each) do
    @cliente = assign(:cliente, Cliente.create!(
      :descricao => "MyString",
      :contato => "MyString",
      :endereco => "MyString",
      :cep => "MyString",
      :telefone => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit cliente form" do
    render

    assert_select "form[action=?][method=?]", cliente_path(@cliente), "post" do

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
