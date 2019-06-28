class AddCodigoToProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :codigo, :string
  end
end
