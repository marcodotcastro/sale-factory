require "rails_helper"

RSpec.feature "Convite", :type => :feature do

  scenario "enviar" do
    #DADO
    usuario_logado({tipo: :industria})
    perfil_cadastrado({descricao: "Usuário 1", tipo: :industria})

    #QUANDO
    visit root_path
    click_link "Representante"
    fill_in "Nome", with: "Usuário 2"
    fill_in "Email", with: "usuario2@gmail.com"
    click_button "Enviar Convite"

    #ENTÃO
    expect(page).to_not have_text("Convidar")
  end

end
