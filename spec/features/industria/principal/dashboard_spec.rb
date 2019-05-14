require "rails_helper"

RSpec.feature "Dashboard", :type => :feature do

  scenario "informações" do
    #DADO
    usuario_logado({tipo: :industria})
    perfil_cadastrado({descricao: "Usuário 1", tipo: :industria})
    create_list(:representante, 3, industrias: [Industria.last])

    #QUANDO
    visit root_path
    click_link "Dashboard"

    #ENTÃO
    expect(page).to have_text("TOTAL DE REPRESENTANTES")
    expect(page).to have_text("TOTAL DE VENDAS")
    expect(page).to have_text("TOTAL DE LOJISTAS")
    expect(page).to have_text("TOTAL DE CIDADES")
    expect(page).to have_text("TOTAL DE RECEITAS")
  end

end
