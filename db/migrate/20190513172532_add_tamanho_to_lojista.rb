class AddTamanhoToLojista < ActiveRecord::Migration[5.2]
  def change
    add_column :lojistas, :tamanho, :integer
  end
end
