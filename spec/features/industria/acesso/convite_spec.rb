require "rails_helper"

RSpec.feature "Convite", :type => :feature do

  before(:each) do
  end

  scenario "enviar" do
    login
    cadastrar_perfil

    visit root_path

    click_link "Representante"

    expect(page).to have_text("Convidar")

    fill_in "Nome", with: "Usuário 2"
    fill_in "Email", with: "usuario2@gmail.com"

    click_button "Enviar Convite"

    expect(page).to_not have_text("Convidar")

  end

end
