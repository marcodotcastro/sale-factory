require "rails_helper"

RSpec.feature "Perfil Industrias", :type => :feature do

  scenario "login" do
    usuario_logado({tipo: :industria})
  end

  scenario "criar perfil" do
    usuario_logado({tipo: :industria})
    perfil_cadastrado({descricao: "Indústria 1", tipo: :industria})
  end

  scenario "alterar perfil" do
    #DADO
    usuario_logado({tipo: :industria})
    perfil_cadastrado({descricao: "Indústria 1", tipo: :industria})

    #QUANDO
    click_link "Perfil"
    click_link "Editar Perfil"
    fill_in "Descrição", with: "Indústria 2"
    select "Farmacêutico", from: "Setor"
    select "Goiânia", from: "Cidade"
    click_button "Editar Perfil"

    #ENTÃO
    expect(page).to have_text("INDÚSTRIA 2")
  end

end
