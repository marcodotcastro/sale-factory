require "rails_helper"

RSpec.feature "Listar Industrias", :type => :feature do

  before(:all) do
    create(:representante, :com_lojista)
  end

  scenario "ver principal" do
    visit principais_index_path

    click_link "Industrias"

    expect(page).to have_text("Industrias")
    expect(page).to have_text("Indústria Farmacêutica Melcon do Brasil S.A.")
  end

  scenario "ver industria" do
    visit principais_index_path

    click_link "Industrias"
    click_link "Show", match: :first

    expect(page).to have_text("representantes")
    expect(page).to have_text("Indústria Farmacêutica Melcon do Brasil S.A.")
    expect(page).to have_text("A R Olivo Representações Ltda ME 1")
  end

  scenario "ver representante" do
    visit principais_index_path

    click_link "Industrias"
    click_link "Show", match: :first
    click_link "Show", match: :first

    expect(page).to_not have_text("Indústria Farmacêutica Melcon do Brasil S.A.")
    expect(page).to have_text("Lojistas")
    expect(page).to have_text("A R Olivo Representações Ltda ME 1")
    expect(page).to have_text("Drogarias Bifarma 1")
  end

  scenario "ver lojista" do
    visit principais_index_path

    click_link "Industrias"
    click_link "Show", match: :first
    click_link "Show", match: :first
    click_link "Show", match: :first

    expect(page).to_not have_text("A R Olivo Representações Ltda ME 1")
    expect(page).to have_text("Drogarias Bifarma 1")
  end

end