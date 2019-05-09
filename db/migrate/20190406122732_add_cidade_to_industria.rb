class AddCidadeToIndustria < ActiveRecord::Migration[5.2]
  def change
    add_reference :industrias, :cidade
  end
end
