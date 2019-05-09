class AddIndustriaAndRepresentante < ActiveRecord::Migration[5.2]
  def change
    create_table :industrias_representantes, id: false do |t|
      t.belongs_to :industria, index: {name: :index_industrias_representantes_on_industria_id}
      t.belongs_to :representante, index: {name: :index_representantes_industrias_on_representante_id}
    end
  end
end
