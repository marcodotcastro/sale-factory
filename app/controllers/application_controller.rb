class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      unless "#{controller_name}##{action_name}".eql? ("registrations#edit") or "#{controller_name}##{action_name}".eql? ("invitations#new") or "#{controller_name}##{action_name}".eql? ("invitations#create")
        "devise"
      else
        "application"
      end
    else
      "application"
    end
  end

end
