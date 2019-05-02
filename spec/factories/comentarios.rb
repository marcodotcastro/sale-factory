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
    descricao { "MyString" }
    usuario { nil }
    solicitacao { nil }
  end
end
