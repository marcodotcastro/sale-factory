require 'rails_helper'

RSpec.describe "cidades/show", type: :view do
  before(:each) do
    @cidade = assign(:cidade, Cidade.create!(
      :descricao => "Descricao",
      :estado => "Estado",
      :populacao => 2,
      :latitude => 3.5,
      :longitude => 4.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
  end
end
