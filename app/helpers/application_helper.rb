module ApplicationHelper

  def foto_logo_url(usuario)
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    if usuario.cliente?
      if usuario.cliente
        image_tag(usuario.cliente.logo.attached? ? usuario.cliente.logo : foto_vazia, class: "img-rectangle", size: "100x50")
      end
    elsif usuario.representante_comercial?
      if usuario.representante_comercial
        image_tag(usuario.representante_comercial.logo.attached? ? usuario.representante_comercial.logo : foto_vazia, class: "img-rectangle", size: "100x50")
      end
    end

  end

end
