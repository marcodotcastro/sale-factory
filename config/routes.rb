Rails.application.routes.draw do
  resources :clientes
  resources :cidades
  get 'principais/index'
  root to: 'principais#index'

  resources :lojistas
  get "service_area/lojistas", to: "lojistas#service_area"

  resources :representante_comerciais
  get "service_area/representante_comerciais", to: "representante_comerciais#service_area"

end
