class AddUsuarioToRepresentante < ActiveRecord::Migration[5.2]
  def change
    add_reference :representante_comerciais, :usuario, foreign_key: true
  end
end
