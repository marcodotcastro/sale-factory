module AcessoHelper

  def cadastrar_usuario
    visit root_path

    click_link "Crie Uma Conta"

    fill_in "Nome", with: "Usuário 1"
    fill_in "Email", with: "usuario1@gmail.com"
    fill_in "Senha", with: "12345678"
    fill_in "Confirmação Senha", with: "12345678"

    click_button "Cadastrar"

    expect(page).to have_text("Usuário 1")
  end

  def login
    create(:usuario, nome: "Usuário 1", tipo: :industria, email: "usuario1@gmail.com", password: "12345678")

    visit root_path

    fill_in "Email", with: "usuario1@gmail.com"
    fill_in "Senha", with: "12345678"

    click_button "Autenticar"

    expect(page).to have_text("Usuário 1")
  end


  def cadastrar_perfil
    create(:setor, descricao: "Farmacêutico")
    create(:cidade, descricao: "Goiânia")

    click_link "Perfil"

    expect(page).to have_text("Criar Perfil")

    fill_in "Descrição", with: "Indústria 1"
    select "Farmacêutico", from: "Setor"
    select "Goiânia", from: "Cidade"

    click_button "Salvar Perfil"

    expect(page).to have_text("INDÚSTRIA 1")
  end
end
