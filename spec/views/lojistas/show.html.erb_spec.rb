require 'rails_helper'

RSpec.describe "lojistas/show", type: :view do
  before(:each) do
    @lojista = assign(:lojista, Lojista.create!(
      :nome => "Nome",
      :endereco => "Endereco",
      :telefone => "Telefone",
      :cep => "Cep",
      :latitude => 2.5,
      :longitude => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Endereco/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
