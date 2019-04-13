class AddRepresentanteComercialAndLojista < ActiveRecord::Migration[5.2]
  def change
    create_table :lojistas_representante_comerciais, id: false do |t|
      t.belongs_to :representante_comercial, index: {name: :index_representantes_lojistas_on_representante_comercial_id}
      t.belongs_to :lojista, index: {name: :index_lojistas_representantes_on_lojista_id}
    end
  end
end
