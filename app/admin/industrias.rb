ActiveAdmin.register Industria do
  menu priority: 2
  breadcrumb do
    ['admin', 'indústrias']
  end

  actions :index

  filter :descricao

  index do
    selectable_column
    column :descricao

    column "Plano / Preço" do |industria|
      "#{industria.usuario.assinatura.plano.descricao} / #{number_to_currency industria.usuario.assinatura.plano.preco}"
    end

    column "Convites Usados", sortable: :name do |industria|
      industria.representantes.count
    end

    column "Vendas" do |industria|
      industria.total_de_vendas
    end

    column "Receitas" do |industria|
      number_to_currency industria.total_de_receitas
    end

    column "Lojistas" do |industria|
      industria.total_de_lojistas
    end

    column "Cidades" do |industria|
      industria.total_de_cidades
    end

    actions
  end


end
