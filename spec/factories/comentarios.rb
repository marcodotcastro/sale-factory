# == Schema Information
#
# Table name: comentarios
#
#  id             :bigint(8)        not null, primary key
#  descricao      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  solicitacao_id :bigint(8)
#  usuario_id     :bigint(8)
#
# Indexes
#
#  index_comentarios_on_solicitacao_id  (solicitacao_id)
#  index_comentarios_on_usuario_id      (usuario_id)
#

FactoryBot.define do
  factory :comentario do
    descricao {Faker::Lorem.sentence}

    before(:create) do |comentario|
      #Vincular solicitação
      comentario.solicitacao = Solicitacao.all.sample

      #Vincular usuário
      usuarios = [comentario.solicitacao.industria.usuario, comentario.solicitacao.representante.usuario]
      comentario.usuario = usuarios.sample
    end

  end
end
