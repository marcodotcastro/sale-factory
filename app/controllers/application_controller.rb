class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!

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

end
