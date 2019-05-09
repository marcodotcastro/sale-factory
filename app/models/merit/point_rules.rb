# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      # score 10, :on => 'users#create' do |user|
      #   user.bio.present?
      # end
      #
      # score 15, :on => 'reviews#create', :to => [:reviewer, :reviewed]
      #
      # score 20, :on => [
      #   'comments#create',
      #   'photos#create'
      # ]
      #
      # score -10, :on => 'comments#destroy'
      #

      # Representante
      ## Venda
      score 5, :on => 'representantes/solicitacoes#status', model_name: "Solicitacao" do |solicitacao|
        solicitacao.solicitado?
      end
      score -30, :on => 'representantes/solicitacoes#status', model_name: "Solicitacao" do |solicitacao|
        solicitacao.cancelado?
      end
      score 0, :on => 'industrias/solicitacoes#status', model_name: "Solicitacao" do |solicitacao|
        solicitacao.representante.usuario.add_points(20) if solicitacao.aceito?
      end
      score 0, :on => 'industrias/solicitacoes#status', model_name: "Solicitacao" do |solicitacao|
        solicitacao.representante.usuario.add_points(-25) if solicitacao.recusado?
      end
      score 0, :on => 'industrias/solicitacoes#status', model_name: "Solicitacao" do |solicitacao|
        solicitacao.representante.usuario.add_points(-30) if solicitacao.cancelado?
      end
      ## Lojista
      score 10, :on => 'representantes/lojistas#create'
      score -15, :on => 'representantes/lojistas#destroy'

    end
  end
end
