# == Schema Information
#
# Table name: usuarios
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  nome                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tipo                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :bigint(8)
#
# Indexes
#
#  index_usuarios_on_email                              (email) UNIQUE
#  index_usuarios_on_invitation_token                   (invitation_token) UNIQUE
#  index_usuarios_on_invitations_count                  (invitations_count)
#  index_usuarios_on_invited_by_id                      (invited_by_id)
#  index_usuarios_on_invited_by_type_and_invited_by_id  (invited_by_type,invited_by_id)
#  index_usuarios_on_reset_password_token               (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :usuario do
    sequence(:email) {|n| "joao.paulo#{n}@melcon.com.br"}
    nome {"João Paulo"}
    password {12345678}
    tipo {:cliente}
  end
end
