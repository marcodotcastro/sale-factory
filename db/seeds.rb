require 'csv'


# ["Construção", "Alimentos", "Serviços Industrial de Utilidade Pública", "Derivados de Petróleo e Biocomustíveis", "Químicos", "Metalurgia", "Farmacêutico"].each do |descricao|
#   Setor.create(descricao: descricao)
# end

# FactoryBot.create(:cliente, :com_representante_comerciais)
FactoryBot.create(:representante_comercial, :com_cliente, :com_lojistas)
