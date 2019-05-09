class Industrias::ComentariosController < ApplicationController
  before_action :set_industria, only: [:show, :new, :create]
  before_action :set_solicitacao, only: [:show, :new, :create]

  def show
  end

  def new
    @comentario = Comentario.new
  end

  def edit
  end

  def create
    @comentario = Comentario.new(comentario_params)
    @comentario.solicitacao = @solicitacao

    respond_to do |format|
      if @comentario.save!
        format.html {redirect_to industria_solicitacao_path(@industria, @solicitacao), flash: {success: 'Comentario foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html {redirect_to @comentario, flash: {success: 'Comentario foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html {redirect_to root_path, flash: {success: 'Comentario foi excluido com sucesso.'}}
    end
  end

  private

  def set_comentario
    @comentario = Comentario.find(params[:id])
  end

  def set_solicitacao
    @solicitacao = Solicitacao.find(params[:solicitacao_id])
  end

  def set_industria
    @industria = current_usuario.industria
  end

  def comentario_params
    params.require(:comentario).permit(:descricao, :usuario_id, :solicitacao_id)
  end
end
