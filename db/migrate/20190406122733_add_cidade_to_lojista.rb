class AddCidadeToLojista < ActiveRecord::Migration[5.2]
  def change
    add_reference :lojistas, :cidade
  end
end
