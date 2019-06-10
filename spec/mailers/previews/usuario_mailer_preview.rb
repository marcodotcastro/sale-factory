class UsuarioMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(Usuario.first, {})
  end

  def email_changed
    Devise::Mailer.email_changed(Usuario.first, {})
  end

  def invitation_instructions
    Devise::Mailer.invitation_instructions(Usuario.first, {})
  end

  def password_change
    Devise::Mailer.password_change(Usuario.first, {})
  end

  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(Usuario.first, {})
  end

  def unlock_instructions
    Devise::Mailer.unlock_instructions(Usuario.first, {})
  end

end
