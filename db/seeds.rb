require 'csv'


# ["Construção", "Alimentos", "Serviços Industrial de Utilidade Pública", "Derivados de Petróleo e Biocomustíveis", "Químicos", "Metalurgia", "Farmacêutico"].each do |descricao|
#   Setor.create(descricao: descricao)
# end


FactoryBot.create(:representante_comercial, :com_lojistas)
