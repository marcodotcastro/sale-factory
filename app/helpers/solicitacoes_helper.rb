module SolicitacoesHelper

  def situacao_botao(solicitacao)
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-round btn-success") if solicitacao.aceito?
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-round btn-info") if solicitacao.resolvido? or solicitacao.solicitado? or solicitacao.criado?
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-round btn-warning") if solicitacao.analisado? or solicitacao.pendente?
    botao = content_tag(:div, solicitacao.status.capitalize, class: "btn btn-round btn-danger") if solicitacao.cancelado? or solicitacao.recusado?
    return botao
  end

end