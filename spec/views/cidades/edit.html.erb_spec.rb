require 'rails_helper'

RSpec.describe "cidades/edit", type: :view do
  before(:each) do
    @cidade = assign(:cidade, Cidade.create!(
      :descricao => "MyString",
      :estado => "MyString",
      :populacao => 1,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit cidade form" do
    render

    assert_select "form[action=?][method=?]", cidade_path(@cidade), "post" do

      assert_select "input[name=?]", "cidade[descricao]"

      assert_select "input[name=?]", "cidade[estado]"

      assert_select "input[name=?]", "cidade[populacao]"

      assert_select "input[name=?]", "cidade[latitude]"

      assert_select "input[name=?]", "cidade[longitude]"
    end
  end
end
