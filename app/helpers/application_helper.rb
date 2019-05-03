module ApplicationHelper

  def foto_logo_url(usuario)
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    if usuario.cliente?
      if usuario.cliente
        image_tag(usuario.cliente.logo.attached? ? usuario.cliente.logo : foto_vazia, class: "img-rectangle img-fluid")
      end
    elsif usuario.representante?
      if usuario.representante
        image_tag(usuario.representante.logo.attached? ? usuario.representante.logo : foto_vazia, class: "img-rectangle img-fluid")
      end
    end

  end

end
