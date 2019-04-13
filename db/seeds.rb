require 'csv'


# ["Construção", "Alimentos", "Serviços Industrial de Utilidade Pública", "Derivados de Petróleo e Biocomustíveis", "Químicos", "Metalurgia", "Farmacêutico"].each do |descricao|
#   Setor.create(descricao: descricao)
# end

FactoryBot.create(:cliente, :com_representantes)
FactoryBot.create(:representante, :com_cliente, :com_lojistas)
