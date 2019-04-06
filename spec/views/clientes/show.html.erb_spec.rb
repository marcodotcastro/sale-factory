require 'rails_helper'

RSpec.describe "clientes/show", type: :view do
  before(:each) do
    @cliente = assign(:cliente, Cliente.create!(
      :descricao => "Descricao",
      :contato => "Contato",
      :endereco => "Endereco",
      :cep => "Cep",
      :telefone => "Telefone",
      :latitude => 2.5,
      :longitude => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/Contato/)
    expect(rendered).to match(/Endereco/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
