require 'csv'


# ["Construção", "Alimentos", "Serviços Industrial de Utilidade Pública", "Derivados de Petróleo e Biocomustíveis", "Químicos", "Metalurgia", "Farmacêutico"].each do |descricao|
#   Setor.create(descricao: descricao)
# end

FactoryBot.create(:cliente, :com_representantes)
FactoryBot.create(:representante, :com_cliente, :com_lojistas)


Usuario.where(tipo: :representante).each do |usuario|
  usuario.update(invited_by_id: Cliente.all.sample.id, invited_by_type: :cliente)
end
