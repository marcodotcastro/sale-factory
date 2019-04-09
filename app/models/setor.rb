# == Schema Information
#
# Table name: setores
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Setor < ApplicationRecord
  has_many :clientes
end
