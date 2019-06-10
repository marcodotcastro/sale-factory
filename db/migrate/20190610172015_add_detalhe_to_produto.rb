class AddDetalheToProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :detalhe, :text
  end
end
