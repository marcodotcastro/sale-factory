class AddUsuarioToIndustria < ActiveRecord::Migration[5.2]
  def change
    add_reference :industrias, :usuario
  end
end
