FactoryBot.define do
  factory :cidade do
    descricao { "MyString" }
    estado { "MyString" }
    populacao { 1 }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
