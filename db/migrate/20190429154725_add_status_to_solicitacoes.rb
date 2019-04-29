class AddStatusToSolicitacoes < ActiveRecord::Migration[5.2]
  def change
    add_column :solicitacoes, :status, :string
  end
end
