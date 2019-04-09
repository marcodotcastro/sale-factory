# == Schema Information
#
# Table name: usuarios
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  nome                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_usuarios_on_email                 (email) UNIQUE
#  index_usuarios_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :usuario do
    sequence(:email) {|n| "joao.paulo#{n}@melcon.com.br"}
    nome {"Joao Paulo"}
    password {12345678}
  end
end
