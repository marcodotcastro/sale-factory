class Usuarios::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:usuario).permit(:nome, :avatar, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:usuario).permit(:nome, :avatar, :email, :password, :password_confirmation, :current_password)
  end
end
