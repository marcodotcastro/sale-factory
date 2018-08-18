class CreateRepresentatives < ActiveRecord::Migration[5.2]
  def change
    create_table :representatives do |t|

      t.timestamps
    end
  end
end
