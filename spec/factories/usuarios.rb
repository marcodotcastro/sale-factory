# == Schema Information
#
# Table name: usuarios
#
#  id                     :bigint(8)        not null, primary key
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invited_by_type        :string
#  level                  :integer          default(0)
#  nome                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tipo                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invited_by_id          :integer
#  sash_id                :integer
#
# Indexes
#
#  index_usuarios_on_deleted_at            (deleted_at)
#  index_usuarios_on_email                 (email) UNIQUE
#  index_usuarios_on_invitation_token      (invitation_token) UNIQUE
#  index_usuarios_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :usuario do
    sequence(:email) {|n| "joao.paulo#{n}@melcon.com.br"}
    nome {"João Paulo"}
    password {12345678}
    tipo {[:cliente, :representante].sample}

    after(:create) do |usuario|
      if usuario.representante?
        usuario.avatar.attach(io: File.open(Rails.root.join("spec", "files", "representante-usuario-#{rand(1..4)}.jpg")), filename: "representante-usuario-#{rand(1..4)}.jpg", content_type: "image/jpeg")
      else
        usuario.avatar.attach(io: File.open(Rails.root.join("spec", "files", "cliente-usuario-#{rand(1..7)}.jpg")), filename: "cliente-usuario-#{rand(1..7)}.jpg", content_type: "image/jpeg")
      end
    end

  end
end
