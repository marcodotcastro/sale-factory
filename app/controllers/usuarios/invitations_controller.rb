class Usuarios::InvitationsController < Devise::InvitationsController

  def create
    @usuario = Usuario.find_by(email: usuario_params[:email])

    respond_to do |format|
      format.html {redirect_to new_usuario_invitation_path, flash: {error: "Convite já enviado"}} if @usuario

      if Usuario.invite!(usuario_params)
        format.html {redirect_to root_path, flash: {success: 'Convite enviado com sucesso.'}}
      else
        format.html {redirect_to new_usuario_invitation_path, flash: {error: "Convite não enviado."}}
      end
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :tipo, :password, :password_confirmation, :invited_by_id, :invited_by_type, :invitation_token, :invitation_accepted_at)
  end

end
