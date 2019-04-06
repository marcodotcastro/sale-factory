require 'rails_helper'

RSpec.describe "lojistas/index", type: :view do
  before(:each) do
    assign(:lojistas, [
      Lojista.create!(
        :nome => "Nome",
        :endereco => "Endereco",
        :telefone => "Telefone",
        :cep => "Cep",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      Lojista.create!(
        :nome => "Nome",
        :endereco => "Endereco",
        :telefone => "Telefone",
        :cep => "Cep",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of lojistas" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
