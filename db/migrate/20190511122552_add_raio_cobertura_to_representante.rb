class AddRaioCoberturaToRepresentante < ActiveRecord::Migration[5.2]
  def change
    add_column :representantes, :raio_cobertura, :integer
  end
end
