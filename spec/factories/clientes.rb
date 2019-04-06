FactoryBot.define do
  factory :cliente do
    descricao { "MyString" }
    contato { "MyString" }
    endereco { "MyString" }
    cep { "MyString" }
    telefone { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
