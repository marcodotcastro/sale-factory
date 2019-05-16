class Usuarios::RegistrationsController < Devise::RegistrationsController

  def create
    @user = build_resource
    super
  end

  def update
    @user = resource
    super
  end

  private

  def sign_up_params
    params.require(:usuario).permit(:nome, :avatar, :email, :tipo, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:usuario).permit(:nome, :avatar, :email, :cpf, :tipo, :password, :password_confirmation, :current_password)
  end
end
