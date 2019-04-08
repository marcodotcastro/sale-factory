# == Route Map
#
#                                                                Prefix Verb   URI Pattern                                                                                                                     Controller#Action
#                                                      principais_index GET    /principais/index(.:format)                                                                                                     principais#index
#                                                                  root GET    /                                                                                                                               principais#index
# cliente_representante_comercial_service_area_representante_comerciais GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/service_area/representante_comerciais(.:format)      representante_comerciais#service_area
#         cliente_representante_comercial_lojista_service_area_lojistas GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:lojista_id/service_area/lojistas(.:format) lojistas#service_area
#                              cliente_representante_comercial_lojistas GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas(.:format)                                   lojistas#index
#                                                                       POST   /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas(.:format)                                   lojistas#create
#                           new_cliente_representante_comercial_lojista GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/new(.:format)                               lojistas#new
#                          edit_cliente_representante_comercial_lojista GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id/edit(.:format)                          lojistas#edit
#                               cliente_representante_comercial_lojista GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               lojistas#show
#                                                                       PATCH  /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               lojistas#update
#                                                                       PUT    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               lojistas#update
#                                                                       DELETE /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               lojistas#destroy
#                                      cliente_representante_comerciais GET    /clientes/:cliente_id/representante_comerciais(.:format)                                                                        representante_comerciais#index
#                                                                       POST   /clientes/:cliente_id/representante_comerciais(.:format)                                                                        representante_comerciais#create
#                                   new_cliente_representante_comercial GET    /clientes/:cliente_id/representante_comerciais/new(.:format)                                                                    representante_comerciais#new
#                                  edit_cliente_representante_comercial GET    /clientes/:cliente_id/representante_comerciais/:id/edit(.:format)                                                               representante_comerciais#edit
#                                       cliente_representante_comercial GET    /clientes/:cliente_id/representante_comerciais/:id(.:format)                                                                    representante_comerciais#show
#                                                                       PATCH  /clientes/:cliente_id/representante_comerciais/:id(.:format)                                                                    representante_comerciais#update
#                                                                       PUT    /clientes/:cliente_id/representante_comerciais/:id(.:format)                                                                    representante_comerciais#update
#                                                                       DELETE /clientes/:cliente_id/representante_comerciais/:id(.:format)                                                                    representante_comerciais#destroy
#                                                              clientes GET    /clientes(.:format)                                                                                                             clientes#index
#                                                                       POST   /clientes(.:format)                                                                                                             clientes#create
#                                                           new_cliente GET    /clientes/new(.:format)                                                                                                         clientes#new
#                                                          edit_cliente GET    /clientes/:id/edit(.:format)                                                                                                    clientes#edit
#                                                               cliente GET    /clientes/:id(.:format)                                                                                                         clientes#show
#                                                                       PATCH  /clientes/:id(.:format)                                                                                                         clientes#update
#                                                                       PUT    /clientes/:id(.:format)                                                                                                         clientes#update
#                                                                       DELETE /clientes/:id(.:format)                                                                                                         clientes#destroy
#                                                               cidades GET    /cidades(.:format)                                                                                                              cidades#index
#                                                                       POST   /cidades(.:format)                                                                                                              cidades#create
#                                                            new_cidade GET    /cidades/new(.:format)                                                                                                          cidades#new
#                                                           edit_cidade GET    /cidades/:id/edit(.:format)                                                                                                     cidades#edit
#                                                                cidade GET    /cidades/:id(.:format)                                                                                                          cidades#show
#                                                                       PATCH  /cidades/:id(.:format)                                                                                                          cidades#update
#                                                                       PUT    /cidades/:id(.:format)                                                                                                          cidades#update
#                                                                       DELETE /cidades/:id(.:format)                                                                                                          cidades#destroy
#                                                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                                                      active_storage/blobs#show
#                                             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)                                        active_storage/representations#show
#                                                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                                                     active_storage/disk#show
#                                             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                                                             active_storage/disk#update
#                                                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                                                  active_storage/direct_uploads#create

Rails.application.routes.draw do

  get 'dashboard/index'
  get 'dashboard/index2'
  get 'dashboard/index3'

  get 'principais/index'
  root to: 'principais#index'

  resources :clientes do
    resources :representante_comerciais do
      get "service_area/representante_comerciais", to: "representante_comerciais#service_area"
      resources :lojistas do
        get "service_area/lojistas", to: "lojistas#service_area"
      end
    end
  end

  resources :cidades
end
