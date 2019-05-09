# == Schema Information
#
# Table name: solicitacoes
#
#  id               :bigint(8)        not null, primary key
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  industria_id     :bigint(8)
#  lojista_id       :bigint(8)
#  representante_id :bigint(8)
#
# Indexes
#
#  index_solicitacoes_on_industria_id      (industria_id)
#  index_solicitacoes_on_lojista_id        (lojista_id)
#  index_solicitacoes_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (industria_id => industrias.id)
#  fk_rails_...  (lojista_id => lojistas.id)
#  fk_rails_...  (representante_id => representantes.id)
#

module SolicitacoesHelper

  def situacao_botao(solicitacao)
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-xs btn-success") if solicitacao.aceito?
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-xs btn-info") if solicitacao.resolvido? or solicitacao.solicitado? or solicitacao.criado?
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-xs btn-warning") if solicitacao.analisado? or solicitacao.pendente?
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-xs btn-danger") if solicitacao.cancelado? or solicitacao.recusado?
    return botao
  end

end

