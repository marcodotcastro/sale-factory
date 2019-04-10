# == Route Map
#
#                                                                Prefix Verb   URI Pattern                                                                                                                     Controller#Action
#                                                     letter_opener_web        /letter_opener/inbox                                                                                                            LetterOpenerWeb::Engine
#                                                   new_usuario_session GET    /usuarios/sign_in(.:format)                                                                                                     devise/sessions#new
#                                                       usuario_session POST   /usuarios/sign_in(.:format)                                                                                                     devise/sessions#create
#                                               destroy_usuario_session DELETE /usuarios/sign_out(.:format)                                                                                                    devise/sessions#destroy
#                                                  new_usuario_password GET    /usuarios/password/new(.:format)                                                                                                devise/passwords#new
#                                                 edit_usuario_password GET    /usuarios/password/edit(.:format)                                                                                               devise/passwords#edit
#                                                      usuario_password PATCH  /usuarios/password(.:format)                                                                                                    devise/passwords#update
#                                                                       PUT    /usuarios/password(.:format)                                                                                                    devise/passwords#update
#                                                                       POST   /usuarios/password(.:format)                                                                                                    devise/passwords#create
#                                           cancel_usuario_registration GET    /usuarios/cancel(.:format)                                                                                                      usuarios/registrations#cancel
#                                              new_usuario_registration GET    /usuarios/sign_up(.:format)                                                                                                     usuarios/registrations#new
#                                             edit_usuario_registration GET    /usuarios/edit(.:format)                                                                                                        usuarios/registrations#edit
#                                                  usuario_registration PATCH  /usuarios(.:format)                                                                                                             usuarios/registrations#update
#                                                                       PUT    /usuarios(.:format)                                                                                                             usuarios/registrations#update
#                                                                       DELETE /usuarios(.:format)                                                                                                             usuarios/registrations#destroy
#                                                                       POST   /usuarios(.:format)                                                                                                             usuarios/registrations#create
#                                             accept_usuario_invitation GET    /usuarios/invitation/accept(.:format)                                                                                           usuarios/invitations#edit
#                                             remove_usuario_invitation GET    /usuarios/invitation/remove(.:format)                                                                                           usuarios/invitations#destroy
#                                                new_usuario_invitation GET    /usuarios/invitation/new(.:format)                                                                                              usuarios/invitations#new
#                                                    usuario_invitation PATCH  /usuarios/invitation(.:format)                                                                                                  usuarios/invitations#update
#                                                                       PUT    /usuarios/invitation(.:format)                                                                                                  usuarios/invitations#update
#                                                                       POST   /usuarios/invitation(.:format)                                                                                                  usuarios/invitations#create
#                                                               cidades GET    /cidades(.:format)                                                                                                              cidades#index
#                                                                       POST   /cidades(.:format)                                                                                                              cidades#create
#                                                            new_cidade GET    /cidades/new(.:format)                                                                                                          cidades#new
#                                                           edit_cidade GET    /cidades/:id/edit(.:format)                                                                                                     cidades#edit
#                                                                cidade GET    /cidades/:id(.:format)                                                                                                          cidades#show
#                                                                       PATCH  /cidades/:id(.:format)                                                                                                          cidades#update
#                                                                       PUT    /cidades/:id(.:format)                                                                                                          cidades#update
#                                                                       DELETE /cidades/:id(.:format)                                                                                                          cidades#destroy
#                                                      principais_index GET    /principais/index(.:format)                                                                                                     principais#index
#                                                                  root GET    /                                                                                                                               principais#index
#                                                       dashboard_index GET    /dashboard/index(.:format)                                                                                                      dashboard#index
#                                                      dashboard_index2 GET    /dashboard/index2(.:format)                                                                                                     dashboard#index2
#                                                      dashboard_index3 GET    /dashboard/index3(.:format)                                                                                                     dashboard#index3
# cliente_representante_comercial_service_area_representante_comerciais GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/service_area/representante_comerciais(.:format)      representante_comerciais#service_area
#         cliente_representante_comercial_lojista_service_area_lojistas GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:lojista_id/service_area/lojistas(.:format) representante_comerciais/lojistas#service_area
#                              cliente_representante_comercial_lojistas GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas(.:format)                                   representante_comerciais/lojistas#index
#                                                                       POST   /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas(.:format)                                   representante_comerciais/lojistas#create
#                           new_cliente_representante_comercial_lojista GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/new(.:format)                               representante_comerciais/lojistas#new
#                          edit_cliente_representante_comercial_lojista GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id/edit(.:format)                          representante_comerciais/lojistas#edit
#                               cliente_representante_comercial_lojista GET    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               representante_comerciais/lojistas#show
#                                                                       PATCH  /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               representante_comerciais/lojistas#update
#                                                                       PUT    /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               representante_comerciais/lojistas#update
#                                                                       DELETE /clientes/:cliente_id/representante_comerciais/:representante_comercial_id/lojistas/:id(.:format)                               representante_comerciais/lojistas#destroy
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
#                                                              lojistas GET    /lojistas(.:format)                                                                                                             lojistas#index
#                                                                       POST   /lojistas(.:format)                                                                                                             lojistas#create
#                                                           new_lojista GET    /lojistas/new(.:format)                                                                                                         lojistas#new
#                                                          edit_lojista GET    /lojistas/:id/edit(.:format)                                                                                                    lojistas#edit
#                                                               lojista GET    /lojistas/:id(.:format)                                                                                                         lojistas#show
#                                                                       PATCH  /lojistas/:id(.:format)                                                                                                         lojistas#update
#                                                                       PUT    /lojistas/:id(.:format)                                                                                                         lojistas#update
#                                                                       DELETE /lojistas/:id(.:format)                                                                                                         lojistas#destroy
#                                                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                                                      active_storage/blobs#show
#                                             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)                                        active_storage/representations#show
#                                                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                                                     active_storage/disk#show
#                                             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                                                             active_storage/disk#update
#                                                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                                                  active_storage/direct_uploads#create
# 
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  #DESENVOLVIVMENTO
  default_url_options :host => "localhost:3000"

  mount LetterOpenerWeb::Engine, at: "/letter_opener/inbox" if Rails.env.development?

  #ADMINISTRAÇÃO

  devise_for :usuarios, :controllers => {registrations: 'usuarios/registrations', invitations: 'usuarios/invitations'}

  resources :cidades

  #CLIENTES
  get 'principais/index'
  root to: 'principais#index'

  ##DASHBOARDS
  get 'dashboard/index'
  get 'dashboard/index2'
  get 'dashboard/index3'

  resources :clientes do
    resources :representante_comerciais do
      get "service_area/representante_comerciais", to: "representante_comerciais#service_area"

      scope module: 'representante_comerciais' do
        resources :lojistas do
          get "service_area/lojistas", to: "lojistas#service_area"
        end
      end
    end
  end

  resources :lojistas

  #REPRESENTANTES


end
