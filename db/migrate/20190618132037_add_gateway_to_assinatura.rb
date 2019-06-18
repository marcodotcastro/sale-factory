class AddGatewayToAssinatura < ActiveRecord::Migration[5.2]
  def change
    add_column :assinaturas, :gateway_id, :string
  end
end
