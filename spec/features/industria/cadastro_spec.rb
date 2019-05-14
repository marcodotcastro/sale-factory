require "rails_helper"

RSpec.feature "Cadastro", :type => :feature do

  scenario "cadastrar usuário" do
    usuario_cadastrado
  end

  scenario "alterar usuário" do
    #DADO
    usuario_cadastrado

    #QUANDO
    click_link "Conta"
    fill_in "Nome", with: "Usuário 2"
    fill_in "Senha Atual", with: "12345678"
    click_button "Alterar Conta"

    #ENTÃO
    expect(page).to have_text("Usuário 2")
  end

end
