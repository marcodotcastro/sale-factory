class Industrias::AssinaturasController < ApplicationController
  before_action :set_industria, only: [:index, :new, :create]
  before_action :set_assinatura, only: [:show]

  def index
    @assinaturas = get_assinaturas.result(distinct: true).page(params[:page_assinatura])
  end

  def show

  end

  def new
    @assinatura = Assinatura.new
  end

  def create
    @assinatura = Assinatura.new(assinatura_params)

    respond_to do |format|
      if @assinatura.save
        format.html {redirect_to industria_assinaturas_path(@industria), flash: {success: 'Produto foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  private

  def set_assinatura
    @assinatura = Assinatura.find(params[:id])
  end

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

  def get_assinaturas
    @q = current_usuario.assinaturas.order(id: :desc).ransack(params[:q])
  end

  def assinatura_params
    params.require(:assinatura).permit(:usuario_id, :plano_id)
  end

end
