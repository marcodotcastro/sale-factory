class AddCidadeToRepresentante < ActiveRecord::Migration[5.2]
  def change
    add_reference :representantes, :cidade, foreign_key: true
  end
end
