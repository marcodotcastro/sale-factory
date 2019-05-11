class AddVendaDataToSolicitacao < ActiveRecord::Migration[5.2]
  def change
    add_column :solicitacoes, :venda_data, :date
  end
end
