require "rails_helper"

RSpec.feature "Cadastro", :type => :feature do

  before(:each) do
    cadastrar_usuario
  end

  scenario "cadastrar usuário" do
  end

  scenario "alterar usuário" do
    click_link "Conta"

    fill_in "Nome", with: "Usuário 2"
    fill_in "Senha Atual", with: "12345678"

    click_button "Alterar Conta"

    expect(page).to have_text("Usuário 2")
  end

end
