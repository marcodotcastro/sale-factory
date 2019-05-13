require "rails_helper"

RSpec.feature "Perfil Industrias", :type => :feature do

  before(:each) do
    login
  end

  scenario "login" do
  end

  scenario "criar perfil" do
    cadastrar_perfil
  end

  scenario "alterar perfil" do
    cadastrar_perfil

    click_link "Perfil"

    click_link "Editar Perfil"

    expect(page).to have_text("Editar Perfil")

    fill_in "Descrição", with: "Indústria 2"
    select "Farmacêutico", from: "Setor"
    select "Goiânia", from: "Cidade"

    click_button "Salvar Perfil"

    expect(page).to have_text("INDÚSTRIA 2")
  end

end
