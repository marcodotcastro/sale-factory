require 'rails_helper'

RSpec.describe "representante_comerciais/edit", type: :view do
  before(:each) do
    @representante_comercial = assign(:representante_comercial, RepresentanteComercial.create!(
      :descricao => "MyString",
      :contato => "MyString",
      :endereco => "MyString",
      :cep => "MyString",
      :telefone => "MyString",
      :email => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit representante_comercial form" do
    render

    assert_select "form[action=?][method=?]", representante_comercial_path(@representante_comercial), "post" do

      assert_select "input[name=?]", "representante_comercial[descricao]"

      assert_select "input[name=?]", "representante_comercial[contato]"

      assert_select "input[name=?]", "representante_comercial[endereco]"

      assert_select "input[name=?]", "representante_comercial[cep]"

      assert_select "input[name=?]", "representante_comercial[telefone]"

      assert_select "input[name=?]", "representante_comercial[email]"

      assert_select "input[name=?]", "representante_comercial[latitude]"

      assert_select "input[name=?]", "representante_comercial[longitude]"
    end
  end
end
