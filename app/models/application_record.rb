class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  #TODO: Mover para concerns
  def validar_cnpj
    errors.add(:cnpj, "não é valido") unless CNPJ.valid?(self.cnpj)
  end

  def validar_cpf
    errors.add(:cpf, "não é valido") unless CPF.valid?(self.cpf)
  end

end
