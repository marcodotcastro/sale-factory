# == Schema Information
#
# Table name: usuarios
#
#  id                     :bigint(8)        not null, primary key
#  convite_cliente        :integer
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  invitation_token       :string
#  nome                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tipo                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_usuarios_on_deleted_at            (deleted_at)
#  index_usuarios_on_email                 (email) UNIQUE
#  index_usuarios_on_invitation_token      (invitation_token) UNIQUE
#  index_usuarios_on_reset_password_token  (reset_password_token) UNIQUE
#

module UsuariosHelper

  def foto_avatar_url(usuario)
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    usuario.avatar.attached? ? usuario.avatar : foto_vazia
  end

end
