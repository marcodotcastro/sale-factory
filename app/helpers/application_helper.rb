module ApplicationHelper

  def foto_logo_url(empresa)
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    empresa.logo.attached? ? empresa.logo : foto_vazia
  end

end
