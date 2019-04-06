require 'rails_helper'

RSpec.describe "clientes/index", type: :view do
  before(:each) do
    assign(:clientes, [
      Cliente.create!(
        :descricao => "Descricao",
        :contato => "Contato",
        :endereco => "Endereco",
        :cep => "Cep",
        :telefone => "Telefone",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      Cliente.create!(
        :descricao => "Descricao",
        :contato => "Contato",
        :endereco => "Endereco",
        :cep => "Cep",
        :telefone => "Telefone",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of clientes" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Contato".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
