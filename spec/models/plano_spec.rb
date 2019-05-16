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

require 'rails_helper'

RSpec.describe Plano, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
