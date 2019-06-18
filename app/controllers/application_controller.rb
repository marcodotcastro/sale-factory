class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!
  before_action :redicionar_para_assinatura

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      unless ["registrations#edit", "registrations#new", "invitations#new", "invitations#create", "registrations#update"].include? "#{controller_name}##{action_name}"
        "devise"
      else
        "application"
      end
    else
      "application"
    end
  end

  def redicionar_para_assinatura
    if current_usuario
      if current_usuario.industria?
        unless ["assinaturas"].include? "#{controller_name}"
          unless current_usuario.assinatura.ativo?
            respond_to do |format|
              format.html {redirect_to industria_assinatura_path(current_usuario.industria), flash: {error: "Sua assinatura está cancelada, favor atualizar."}}
            end
          end
        end
      end
    end
  end
end
