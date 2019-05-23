class Usuarios::InvitationsController < Devise::InvitationsController

  def create
    respond_to do |format|
      if usuario_params[:email].present?
        if revincular
          format.html {redirect_to root_path, flash: {success: 'Convite enviado com sucesso.'}}
        elsif usuario = Usuario.invite!(usuario_params)
          usuario.update(invited_by_id: usuario_params[:invited_by_id], invited_by_type: usuario_params[:invited_by_type])
          format.html {redirect_to root_path, flash: {success: 'Convite enviado com sucesso.'}}
        else
          format.html {redirect_to new_usuario_invitation_path, flash: {error: "Convite não enviado."}}
        end
      else
        format.html {redirect_to new_usuario_invitation_path, flash: {error: "Email não informado."}}
      end
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :tipo, :password, :password_confirmation, :invited_by_id, :invited_by_type, :invitation_token, :invitation_accepted_at)
  end

  def revincular
    usuario = Usuario.find_by(email: usuario_params[:email])
    if usuario
      representante = usuario.representante
      if representante
        representantes = current_usuario.industria.representantes << usuario.representante
        if representantes.find(representante.id)
          return true
        end
      end
    else
      return false
    end
  end

end
