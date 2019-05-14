require "rails_helper"

RSpec.feature "Perfil Industrias", :type => :feature do

  scenario "criar perfil" do
    #DADO
    usuario_logado({tipo: :industria})
  end

  scenario "alterar perfil" do
    #DADO
    usuario_logado({tipo: :representante})
    perfil_cadastrado({descricao: "Representante 1", tipo: :representante})

    #QUANDO
    click_link "Perfil"
    click_link "Editar Perfil"
    fill_in "Descrição", with: "Representante 2"
    select "Goiânia", from: "Cidade"
    fill_in "Raio de Cobertura", with: "300"
    click_button "Editar Perfil"

    #ENTÃO
    expect(page).to have_text("REPRESENTANTE 2")
  end

end
