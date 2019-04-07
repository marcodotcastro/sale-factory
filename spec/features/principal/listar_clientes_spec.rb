require "rails_helper"

RSpec.feature "Listar Clientes", :type => :feature do

  before(:all) do
    create(:representante_comercial, :com_lojista)
  end

  scenario "ver principal" do
    visit principais_index_path

    click_link "Clientes"

    expect(page).to have_text("Clientes")
    expect(page).to have_text("Indústria Farmacêutica Melcon do Brasil S.A.")
  end

  scenario "ver cliente" do
    visit principais_index_path

    click_link "Clientes"
    click_link "Show"

    expect(page).to have_text("Representantes Comerciais")
    expect(page).to have_text("Indústria Farmacêutica Melcon do Brasil S.A.")
    expect(page).to have_text("A R Olivo Representações Ltda ME 1")
  end

  scenario "ver representante comercial" do
    visit principais_index_path

    click_link "Clientes"
    click_link "Show"
    click_link "Show"

    expect(page).to_not have_text("Indústria Farmacêutica Melcon do Brasil S.A.")
    expect(page).to have_text("Lojistas")
    expect(page).to have_text("A R Olivo Representações Ltda ME 1")
    expect(page).to have_text("Drogarias Bifarma 1")
  end

  scenario "ver lojista" do
    visit principais_index_path

    click_link "Clientes"
    click_link "Show"
    click_link "Show"
    click_link "Show"

    expect(page).to_not have_text("A R Olivo Representações Ltda ME 1")
    expect(page).to have_text("Drogarias Bifarma 1")
  end

end
