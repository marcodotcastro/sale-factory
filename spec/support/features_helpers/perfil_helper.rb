module PerfilHelper

  def perfil_cadastrado(options = {descricao: nil, tipo: nil})
    #DADO
    create(:setor, descricao: "Farmacêutico")
    create(:cidade, descricao: "Goiânia")

    #QUANDO
    click_link "Perfil"
    expect(page).to have_text("Criar Perfil")
    fill_in "Descrição", with: options[:descricao]
    if options[:tipo].eql? :industria
      select "Farmacêutico", from: "Setor"
    else
      fill_in "Raio de Cobertura", with: "250"
    end
    select "Goiânia", from: "Cidade"
    click_button "Salvar Perfil"

    #ENTÃO
    expect(page).to have_text(options[:descricao].upcase)
  end
end
