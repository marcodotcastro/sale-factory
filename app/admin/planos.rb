ActiveAdmin.register Plano do
  menu priority: 4
  breadcrumb do
    ['admin', 'planos']
  end
  index do
    selectable_column
    column :descricao
    column :numero_convites
    column :preco, sortable: :name do |plano|
      number_to_currency plano.preco
    end

    actions
  end
end
