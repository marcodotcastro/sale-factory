class AddGatewayToPlano < ActiveRecord::Migration[5.2]
  def change
    add_column :planos, :gateway_id, :string
  end
end
