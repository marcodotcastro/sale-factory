# == Schema Information
#
# Table name: representante_comerciais
#
#  id         :bigint(8)        not null, primary key
#  cep        :string
#  contato    :string
#  descricao  :string
#  email      :string
#  endereco   :string
#  latitude   :float
#  longitude  :float
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cidade_id  :bigint(8)
#  cliente_id :bigint(8)
#
# Indexes
#
#  index_representante_comerciais_on_cidade_id   (cidade_id)
#  index_representante_comerciais_on_cliente_id  (cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (cliente_id => clientes.id)
#

module RepresentanteComerciaisHelper
end
