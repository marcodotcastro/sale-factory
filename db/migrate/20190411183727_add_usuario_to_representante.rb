class AddUsuarioToRepresentante < ActiveRecord::Migration[5.2]
  def change
    add_reference :representantes, :usuario
  end
end
