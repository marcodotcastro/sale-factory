# == Schema Information
#
# Table name: usuarios
#
#  id                     :bigint(8)        not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  cpf                    :string           default(""), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invited_by_type        :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  level                  :integer          default(0)
#  locked_at              :datetime
#  nome                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  tipo                   :integer
#  unconfirmed_email      :string
#  unlock_token           :string
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
    sequence(:nome) {|n| "Ana Paula #{n}"}
    sequence(:email) {|n| "ana.paula#{n}@gmail.com"}
    cpf {Faker::CPF.numeric}
    confirmed_at {DateTime.now}

    password {12345678}
    tipo {[:industria, :representante].sample}

    trait :vincular_convite do
      before(:create) do |usuario|
        #Vincular convite
        usuario.invited_by_id = Industria.all.sample.id
        usuario.invited_by_type = "Industria"
        usuario.invitation_accepted_at = Time.now
      end
    end

    after(:create) do |usuario|
      #Anexar avatar
      if usuario.representante?
        usuario.avatar.attach(io: File.open(Rails.root.join("spec", "files", "usuarios", "usuario-h-#{rand(1..5)}.jpg")), filename: "industria-usuario-#{rand(1..4)}.jpg", content_type: "image/jpeg")
      else
        usuario.avatar.attach(io: File.open(Rails.root.join("spec", "files", "usuarios", "usuario-m-#{rand(1..6)}.jpg")), filename: "representante-usuario-#{rand(1..7)}.jpg", content_type: "image/jpeg")
      end
    end

  end
end
