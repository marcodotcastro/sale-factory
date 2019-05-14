# == Schema Information
#
# Table name: representantes
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  contato           :string
#  deleted_at        :datetime
#  descricao         :string
#  email             :string
#  endereco          :string
#  latitude          :float
#  longitude         :float
#  raio_cobertura    :integer
#  slug              :string
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representantes_on_cidade_id   (cidade_id)
#  index_representantes_on_deleted_at  (deleted_at)
#  index_representantes_on_slug        (slug) UNIQUE
#  index_representantes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

require 'rails_helper'

RSpec.describe Representante, type: :model do

  before(:all) do
    #DADO
    create(:cidade)
    create(:setor)
    create(:industria, descricao: "Indústria 1")

    create(:representante, descricao: "Representante 1")
  end

  it "representante" do
    #QUANDO
    representante = Representante.last

    #ENTÃO
    expect(representante.descricao).to eq("Representante 1")
    expect(representante.industrias.first.descricao).to eq("Indústria 1")
  end

end
