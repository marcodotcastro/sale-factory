class Industrias::AssinaturasController < ApplicationController
  before_action :set_industria, only: [:show, :edit, :update, :destroy]
  before_action :set_assinatura, only: [:show, :edit, :update, :destroy]

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @assinatura.update(assinatura_params)
        format.html {redirect_to industria_assinatura_path(@industria), flash: {success: 'Representante foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @assinatura.update(ativo: false)
        format.html {redirect_to industria_assinatura_path(@industria), flash: {success: 'Representante foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  private

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

  def set_assinatura
    @assinatura = current_usuario.assinatura
  end

  def assinatura_params
    params.require(:assinatura).permit(:usuario_id, :plano_id, :ativo)
  end

end
