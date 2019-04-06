require 'rails_helper'

RSpec.describe "cidades/index", type: :view do
  before(:each) do
    assign(:cidades, [
      Cidade.create!(
        :descricao => "Descricao",
        :estado => "Estado",
        :populacao => 2,
        :latitude => 3.5,
        :longitude => 4.5
      ),
      Cidade.create!(
        :descricao => "Descricao",
        :estado => "Estado",
        :populacao => 2,
        :latitude => 3.5,
        :longitude => 4.5
      )
    ])
  end

  it "renders a list of cidades" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
  end
end
