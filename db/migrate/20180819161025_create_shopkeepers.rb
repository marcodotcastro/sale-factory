class CreateShopkeepers < ActiveRecord::Migration[5.2]
  def change
    create_table :shopkeepers do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :city
      t.string :phone
      t.string :cep
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
