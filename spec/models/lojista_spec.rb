# == Schema Information
#
# Table name: lojistas
#
#  id                         :bigint(8)        not null, primary key
#  cep                        :string
#  descricao                  :string
#  endereco                   :string
#  latitude                   :float
#  longitude                  :float
#  telefone                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  cidade_id                  :bigint(8)
#  representante_comercial_id :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id                   (cidade_id)
#  index_lojistas_on_representante_comercial_id  (representante_comercial_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (representante_comercial_id => representante_comerciais.id)
#

require 'rails_helper'

RSpec.describe Lojista, type: :model do

  it "uma lojista" do
    @lojista = create(:lojista)

    expect(@lojista.descricao).to eq(Lojista.last.descricao)
    expect(@lojista.cidade.descricao).to eq(Cidade.last.descricao)
  end

end
