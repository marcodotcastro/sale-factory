# == Schema Information
#
# Table name: equipe_industrias
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  industria_id :bigint(8)
#
# Indexes
#
#  index_equipe_industrias_on_industria_id  (industria_id)
#

require 'rails_helper'

RSpec.describe EquipeIndustria, type: :model do


  it "criando equipe" do
    #DADO
    create(:cidade, descricao: "Cidade 1")
    create(:setor, descricao: "Setor 1")
    industria = create(:industria, descricao: "Indústria 1")
    membro1 = create(:usuario, nome: "Membro 1", email: "membro1@gmail.com")
    membro2 = create(:usuario, nome: "Membro 2", email: "membro2@gmail.com")
    industria.build_equipe_industria

    #QUANDO
    industria.equipe_industria.usuarios << membro1
    industria.equipe_industria.usuarios << membro2

    #ENTÃO
    expect(industria.equipe_industria.usuarios.first.email).to eq(membro1.email)
    expect(industria.equipe_industria.usuarios.last.email).to eq(membro2.email)

  end

end
