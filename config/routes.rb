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
# cliente_representante_service_area_representantes GET    /clientes/:cliente_id/representantes/:representante_id/service_area/representantes(.:format)      representantes#service_area
#         cliente_representante_lojista_service_area_lojistas GET    /clientes/:cliente_id/representantes/:representante_id/lojistas/:lojista_id/service_area/lojistas(.:format) representantes/lojistas#service_area
#                              cliente_representante_lojistas GET    /clientes/:cliente_id/representantes/:representante_id/lojistas(.:format)                                   representantes/lojistas#index
#                                                                       POST   /clientes/:cliente_id/representantes/:representante_id/lojistas(.:format)                                   representantes/lojistas#create
#                           new_cliente_representante_lojista GET    /clientes/:cliente_id/representantes/:representante_id/lojistas/new(.:format)                               representantes/lojistas#new
#                          edit_cliente_representante_lojista GET    /clientes/:cliente_id/representantes/:representante_id/lojistas/:id/edit(.:format)                          representantes/lojistas#edit
#                               cliente_representante_lojista GET    /clientes/:cliente_id/representantes/:representante_id/lojistas/:id(.:format)                               representantes/lojistas#show
#                                                                       PATCH  /clientes/:cliente_id/representantes/:representante_id/lojistas/:id(.:format)                               representantes/lojistas#update
#                                                                       PUT    /clientes/:cliente_id/representantes/:representante_id/lojistas/:id(.:format)                               representantes/lojistas#update
#                                                                       DELETE /clientes/:cliente_id/representantes/:representante_id/lojistas/:id(.:format)                               representantes/lojistas#destroy
#                                      cliente_representantes GET    /clientes/:cliente_id/representantes(.:format)                                                                        representantes#index
#                                                                       POST   /clientes/:cliente_id/representantes(.:format)                                                                        representantes#create
#                                   new_cliente_representante GET    /clientes/:cliente_id/representantes/new(.:format)                                                                    representantes#new
#                                  edit_cliente_representante GET    /clientes/:cliente_id/representantes/:id/edit(.:format)                                                               representantes#edit
#                                       cliente_representante GET    /clientes/:cliente_id/representantes/:id(.:format)                                                                    representantes#show
#                                                                       PATCH  /clientes/:cliente_id/representantes/:id(.:format)                                                                    representantes#update
#                                                                       PUT    /clientes/:cliente_id/representantes/:id(.:format)                                                                    representantes#update
#                                                                       DELETE /clientes/:cliente_id/representantes/:id(.:format)                                                                    representantes#destroy
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
  #ADMINISTRAÇÃO
  devise_for :usuarios, :controllers => {invitations: 'usuarios/invitations', registrations: 'usuarios/registrations'}

  get 'principais/index'
  root to: 'principais#index'

  #DESENVOLVIVMENTO
  default_url_options :host => "localhost:3000"

  mount LetterOpenerWeb::Engine, at: "/letter_opener/inbox" if Rails.env.development?

  resources :cidades

  #CLIENTES
  ##DASHBOARDS
  get 'dashboard/cliente'

  ##RECURSOS
  resources :clientes do
    resources :representantes do
      get "service_area/representantes", to: "representantes#service_area"

      scope module: 'representantes' do
        resources :lojistas do
          get "service_area/lojistas", to: "lojistas#service_area"
        end
      end
    end
  end

  resources :lojistas

  #REPRESENTANTES

  ##DASHBOARDS
  get 'dashboard/representante'

  ##RECURSOS
  resources :representantes do
    get "service_area/representantes", to: "representantes#service_area"

    scope module: 'representantes' do
      resources :lojistas do
        get "service_area/lojistas", to: "lojistas#service_area"
      end
    end
  end

end
