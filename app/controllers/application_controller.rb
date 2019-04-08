class ApplicationController < ActionController::Base
  before_action :authenticate_cliente!

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
  
end
