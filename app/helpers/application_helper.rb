module ApplicationHelper

  def foto_logo_url(empresa)
    validar_anexo(empresa ? empresa.logo : nil)
  end

  def foto_url(usuario)
    validar_anexo(usuario ? usuario.foto : nil)
  end

  private

  def validar_anexo(anexo)
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"
    if anexo
      anexo.attached? ? anexo : foto_vazia
    else
      foto_vazia
    end
  end

  def l_if_nil(data)
    data ? l(data, format: :long) : t("Sem Prazo")
  end

end
