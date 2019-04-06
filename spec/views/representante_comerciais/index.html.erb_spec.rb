require 'rails_helper'

RSpec.describe "representante_comerciais/index", type: :view do
  before(:each) do
    assign(:representante_comerciais, [
      RepresentanteComercial.create!(
        :descricao => "Descricao",
        :contato => "Contato",
        :endereco => "Endereco",
        :cep => "Cep",
        :telefone => "Telefone",
        :email => "Email",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      RepresentanteComercial.create!(
        :descricao => "Descricao",
        :contato => "Contato",
        :endereco => "Endereco",
        :cep => "Cep",
        :telefone => "Telefone",
        :email => "Email",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of representante_comerciais" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Contato".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
