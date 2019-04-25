# == Schema Information
#
# Table name: clientes
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
#  slug              :string
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  setor_id          :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id   (cidade_id)
#  index_clientes_on_deleted_at  (deleted_at)
#  index_clientes_on_setor_id    (setor_id)
#  index_clientes_on_slug        (slug) UNIQUE
#  index_clientes_on_usuario_id  (usuario_id)
#

module ClientesHelper


  def cliente(lojista, cliente)
    #TODO: Como refatorar isso?
    if cliente
      cliente = lojista.clientes.select(:id, :descricao).distinct.find_by(id: cliente.id)
      if cliente
        return cliente.descricao
      end
    else
      @representante.clientes.each do |cliente|
        cliente = lojista.clientes.select(:id, :descricao).distinct.find_by(id: cliente.id)
        return cliente.descricao if cliente
      end
    end
    return "Sem Representante"
  end

end
