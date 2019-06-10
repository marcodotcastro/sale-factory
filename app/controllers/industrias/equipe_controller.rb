class Industrias::EquipeController < ApplicationController
  before_action :set_industria, only: [:index, :create, :show, :desvincular]

  def index
    @equipe = Usuario.where(tipo: :equipe_industria).where(invited_by_id: current_usuario.industria.id).page(params[:page_membro])
  end

  def new
    @usuario = Usuario.new
  end

  def show
    @membro = Usuario.find(params[:id])
  end

  def create
    respond_to do |format|
      if usuario_params[:email].present?
        if revincular
          format.html {redirect_to industria_equipe_membros_path(@industria), flash: {success: 'Convite enviado com sucesso.'}}
        elsif usuario = Usuario.invite!(usuario_params)
          usuario.update(invited_by_id: usuario_params[:invited_by_id], invited_by_type: usuario_params[:invited_by_type])
          format.html {redirect_to industria_equipe_membros_path(@industria), flash: {success: 'Convite enviado com sucesso.'}}
        else
          format.html {redirect_to industria_equipe_membros_new_path(@industria), flash: {error: "Convite não enviado."}}
        end
      else
        format.html {redirect_to industria_equipe_membros_new_path(@industria), flash: {error: "Email não informado."}}
      end
    end
  end

  def desvincular
    respond_to do |format|
      if Usuario.find(params[:id]).update(password: Digest::SHA1.hexdigest('zero a senha'))
        format.html {redirect_to industria_equipe_membros_path(@industria), flash: {success: 'Membro foi desvinculado com sucesso.'}}
      else
        format.html {redirect_to industria_equipe_membros_path(@industria), flash: {error: 'Membro não foi desvinculado.'}}
      end
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :tipo, :invited_by_id, :invited_by_type)
  end

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

  def revincular
    usuario = Usuario.find_by(email: usuario_params[:email])
    if usuario
      usuario.send_reset_password_instructions
      return true
    else
      return false
    end
  end
end
