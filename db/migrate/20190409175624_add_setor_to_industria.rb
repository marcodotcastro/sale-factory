class AddSetorToIndustria < ActiveRecord::Migration[5.2]
  def change
    add_reference :industrias, :setor
  end
end
