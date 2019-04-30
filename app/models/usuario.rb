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

class Usuario < ApplicationRecord
  has_merit

  acts_as_paranoid
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cliente, dependent: :destroy
  has_one :representante, dependent: :destroy

  has_one_attached :avatar

  enum tipo: [:cliente, :representante, :cliente_equipe, :representante_equipe]
end
