# == Schema Information
#
# Table name: planos
#
#  id              :bigint(8)        not null, primary key
#  descricao       :string
#  numero_convites :integer
#  preco           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Plano < ApplicationRecord
  has_many :assinaturas
end
