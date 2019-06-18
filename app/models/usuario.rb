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

class Usuario < ApplicationRecord
  has_merit

  acts_as_paranoid
  devise :invitable, :database_authenticatable, :registerable, :confirmable, :trackable,
         :recoverable, :rememberable, :validatable, :lockable

  has_one :industria
  has_one :representante
  has_many :comentarios
  has_one :assinatura

  has_one_attached :avatar

  enum tipo: [:industria, :representante, :equipe_industria]

  after_create :conta_gratis

  validates_presence_of :nome, :cpf
  validate :validar_cpf

  def industria
    self.industria? ? super : self.invited_by
  end

  def convites_disponiveis
    self.assinaturas.where(ativo: true).take.plano.numero_convites
  end

  def convites_usados
    self.industria.representantes.count
  end

  def convite_disponivel?
    (self.convites_disponiveis - self.convites_usados) <= 0
  end

  private

  def conta_gratis
    if self.industria?
      self.assinatura = Assinatura.create(plano: Plano.first)
    end
  end

  def validar_cpf
    errors.add(:cpf, "não é valido") unless CPF.valid?(self.cpf)
  end

end
