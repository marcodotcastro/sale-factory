class AddAtivoToProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :ativo, :boolean
  end
end
