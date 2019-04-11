class Usuarios::InvitationsController < Devise::InvitationsController

  def create
    @usuario = Usuario.find_by(email: usuario_params[:email])

    respond_to do |format|
      format.html {redirect_to new_usuario_invitation_path, flash: {error: "Invite já enviado"}} unless @usuario

      if Usuario.invite!(usuario_params)
        format.html {redirect_to root_path, flash: {success: 'Invite was successfully created.'}}
      else
        format.html {redirect_to new_usuario_invitation_path, flash: {error: "Convite não enviado"}}
      end
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:email, :tipo, :convite_cliente)
  end

end
