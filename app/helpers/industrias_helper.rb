# == Schema Information
#
# Table name: industrias
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
#  index_industrias_on_cidade_id   (cidade_id)
#  index_industrias_on_deleted_at  (deleted_at)
#  index_industrias_on_setor_id    (setor_id)
#  index_industrias_on_slug        (slug) UNIQUE
#  index_industrias_on_usuario_id  (usuario_id)
#

module IndustriasHelper


  def industria(lojista, industria)
    #TODO: Como refatorar isso?
    if industria
      industria = lojista.industrias.select(:id, :descricao).distinct.find_by(id: industria.id)
      if industria
        return industria.descricao
      end
    else
      @representante.industrias.each do |industria|
        industria = lojista.industrias.select(:id, :descricao).distinct.find_by(id: industria.id)
        return industria.descricao if industria
      end
    end
    return "Sem Representante"
  end

end
