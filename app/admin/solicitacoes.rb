ActiveAdmin.register Solicitacao do
  menu priority: 3
  breadcrumb do
    ['admin', 'solicitações']
  end

  actions :index

  filter :industria, collection: -> {
    Industria.joins(:solicitacoes).distinct.map {|map| [map.descricao, map.id]}
  }

  filter :representante, collection: -> {
    Representante.joins(:solicitacoes).distinct.map {|map| [map.descricao, map.id]}
  }

  index do
    selectable_column
    column "Indústria", sortable: :name do |solicitacao|
      solicitacao.industria.descricao
    end

    column :representante, sortable: :name do |solicitacao|
      solicitacao.representante.descricao
    end

    column :lojista, sortable: :name do |solicitacao|
      solicitacao.lojista.descricao
    end

    column "Quantidade" do |solicitacao|
      "#{solicitacao.pedidos.sum(:quantidade)} itens"
    end

    column "Valor" do |solicitacao|
      number_to_currency solicitacao.valor_total_dos_produtos
    end

    actions
  end

end
