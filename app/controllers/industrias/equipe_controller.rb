class Industrias::EquipeController < ApplicationController

  def index
    @equipe = Usuario.where(tipo: :equipe_industria).where(invited_by_id: current_usuario.id).page(params[:page_membro])
  end

  def new
    @usuario = Usuario.new
  end

  def create
    respond_to do |format|
      if usuario_params[:email].present?
        if revincular
          format.html {redirect_to industria_equipe_index_path(current_usuario.industria), flash: {success: 'Convite enviado com sucesso.'}}
        elsif usuario = Usuario.invite!(usuario_params)
          usuario.update(invited_by_id: usuario_params[:invited_by_id], invited_by_type: usuario_params[:invited_by_type])
          format.html {redirect_to industria_equipe_index_path(current_usuario.industria), flash: {success: 'Convite enviado com sucesso.'}}
        else
          format.html {redirect_to industria_equipe_new_path(current_usuario.industria), flash: {error: "Convite não enviado."}}
        end
      else
        format.html {redirect_to industria_equipe_new_path(current_usuario.industria), flash: {error: "Email não informado."}}
      end
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :tipo, :invited_by_id, :invited_by_type)
  end

  def revincular
    usuario = Usuario.find_by(email: usuario_params[:email])
    if usuario
      usuario.update(invited_by_id: current_usuario.id)
      return true
    else
      return false
    end
  end
end
