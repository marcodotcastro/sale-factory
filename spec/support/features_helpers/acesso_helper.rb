module AcessoHelper

  def usuario_cadastrado
    #DADOS

    #QUANDO
    visit root_path
    click_link "Crie Uma Conta"
    fill_in "Nome", with: "Usuário 1"
    fill_in "Email", with: "usuario1@gmail.com"
    fill_in "Senha", with: "12345678"
    fill_in "Confirmação Senha", with: "12345678"
    click_button "Cadastrar"

    #ENTÃO
    expect(page).to have_text("Usuário 1")
  end

  def usuario_logado(options = {tipo: :industria})
    #DADO
    if options[:tipo].eql? :industria
      create(:usuario, nome: "Usuário 1", tipo: :industria, email: "usuario1@gmail.com", password: "12345678")
    else
      create(:usuario, nome: "Usuário 1", tipo: :representante, email: "usuario1@gmail.com", password: "12345678")
    end
    #QUANDO
    visit root_path
    fill_in "Email", with: "usuario1@gmail.com"
    fill_in "Senha", with: "12345678"
    click_button "Autenticar"

    #ENTÃO
    expect(page).to have_text("Usuário 1")
  end

end
