class CreateRepresentatives < ActiveRecord::Migration[5.2]
  def change
    create_table :representatives do |t|
      t.string :description
      t.string :contact
      t.string :address
      t.string :cep
      t.string :phone
      t.string :email
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
