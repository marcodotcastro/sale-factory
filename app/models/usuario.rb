# == Schema Information
#
# Table name: usuarios
#
#  id                     :bigint(8)        not null, primary key
#  convite_cliente        :integer
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

class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cliente
  has_one :representante_comercial

  has_one_attached :avatar

  enum tipo: [:cliente, :representante_comercial, :cliente_equipe, :representante_equipe]
end
