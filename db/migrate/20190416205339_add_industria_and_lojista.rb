class AddIndustriaAndLojista < ActiveRecord::Migration[5.2]
  def change
    create_table :industrias_lojistas, id: false do |t|
      t.belongs_to :lojista, index: {name: :index_lojistas_industrias_on_lojista_id}
      t.belongs_to :industria, index: {name: :index_industrias_lojistas_on_industria_id}
    end
  end
end
