# == Route Map
#
#                                            Prefix Verb   URI Pattern                                                                                  Controller#Action
#                               new_usuario_session GET    /usuarios/sign_in(.:format)                                                                  devise/sessions#new
#                                   usuario_session POST   /usuarios/sign_in(.:format)                                                                  devise/sessions#create
#                           destroy_usuario_session DELETE /usuarios/sign_out(.:format)                                                                 devise/sessions#destroy
#                              new_usuario_password GET    /usuarios/password/new(.:format)                                                             devise/passwords#new
#                             edit_usuario_password GET    /usuarios/password/edit(.:format)                                                            devise/passwords#edit
#                                  usuario_password PATCH  /usuarios/password(.:format)                                                                 devise/passwords#update
#                                                   PUT    /usuarios/password(.:format)                                                                 devise/passwords#update
#                                                   POST   /usuarios/password(.:format)                                                                 devise/passwords#create
#                       cancel_usuario_registration GET    /usuarios/cancel(.:format)                                                                   usuarios/registrations#cancel
#                          new_usuario_registration GET    /usuarios/sign_up(.:format)                                                                  usuarios/registrations#new
#                         edit_usuario_registration GET    /usuarios/edit(.:format)                                                                     usuarios/registrations#edit
#                              usuario_registration PATCH  /usuarios(.:format)                                                                          usuarios/registrations#update
#                                                   PUT    /usuarios(.:format)                                                                          usuarios/registrations#update
#                                                   DELETE /usuarios(.:format)                                                                          usuarios/registrations#destroy
#                                                   POST   /usuarios(.:format)                                                                          usuarios/registrations#create
#                         accept_usuario_invitation GET    /usuarios/invitation/accept(.:format)                                                        usuarios/invitations#edit
#                         remove_usuario_invitation GET    /usuarios/invitation/remove(.:format)                                                        usuarios/invitations#destroy
#                            new_usuario_invitation GET    /usuarios/invitation/new(.:format)                                                           usuarios/invitations#new
#                                usuario_invitation PATCH  /usuarios/invitation(.:format)                                                               usuarios/invitations#update
#                                                   PUT    /usuarios/invitation(.:format)                                                               usuarios/invitations#update
#                                                   POST   /usuarios/invitation(.:format)                                                               usuarios/invitations#create
#                                  principais_index GET    /principais/index(.:format)                                                                  principais#index
#                                              root GET    /                                                                                            principais#index
#                                 letter_opener_web        /letter_opener/inbox                                                                         LetterOpenerWeb::Engine
#                                           cidades GET    /cidades(.:format)                                                                           cidades#index
#                                                   POST   /cidades(.:format)                                                                           cidades#create
#                                        new_cidade GET    /cidades/new(.:format)                                                                       cidades#new
#                                       edit_cidade GET    /cidades/:id/edit(.:format)                                                                  cidades#edit
#                                            cidade GET    /cidades/:id(.:format)                                                                       cidades#show
#                                                   PATCH  /cidades/:id(.:format)                                                                       cidades#update
#                                                   PUT    /cidades/:id(.:format)                                                                       cidades#update
#                                                   DELETE /cidades/:id(.:format)                                                                       cidades#destroy
#                                 dashboard_cliente GET    /dashboard/cliente(.:format)                                                                 dashboard#cliente
#             cliente_lojista_service_area_clientes GET    /clientes/:cliente_id/lojistas/:lojista_id/service_area/clientes(.:format)                   clientes/clientes#service_area
#                                  cliente_lojistas GET    /clientes/:cliente_id/lojistas(.:format)                                                     clientes/lojistas#index
#                                                   POST   /clientes/:cliente_id/lojistas(.:format)                                                     clientes/lojistas#create
#                               new_cliente_lojista GET    /clientes/:cliente_id/lojistas/new(.:format)                                                 clientes/lojistas#new
#                              edit_cliente_lojista GET    /clientes/:cliente_id/lojistas/:id/edit(.:format)                                            clientes/lojistas#edit
#                                   cliente_lojista GET    /clientes/:cliente_id/lojistas/:id(.:format)                                                 clientes/lojistas#show
#                                                   PATCH  /clientes/:cliente_id/lojistas/:id(.:format)                                                 clientes/lojistas#update
#                                                   PUT    /clientes/:cliente_id/lojistas/:id(.:format)                                                 clientes/lojistas#update
#                                                   DELETE /clientes/:cliente_id/lojistas/:id(.:format)                                                 clientes/lojistas#destroy
# cliente_representante_service_area_representantes GET    /clientes/:cliente_id/representantes/:representante_id/service_area/representantes(.:format) clientes/representantes#service_area
#                            cliente_representantes GET    /clientes/:cliente_id/representantes(.:format)                                               clientes/representantes#index
#                                                   POST   /clientes/:cliente_id/representantes(.:format)                                               clientes/representantes#create
#                         new_cliente_representante GET    /clientes/:cliente_id/representantes/new(.:format)                                           clientes/representantes#new
#                        edit_cliente_representante GET    /clientes/:cliente_id/representantes/:id/edit(.:format)                                      clientes/representantes#edit
#                             cliente_representante GET    /clientes/:cliente_id/representantes/:id(.:format)                                           clientes/representantes#show
#                                                   PATCH  /clientes/:cliente_id/representantes/:id(.:format)                                           clientes/representantes#update
#                                                   PUT    /clientes/:cliente_id/representantes/:id(.:format)                                           clientes/representantes#update
#                                                   DELETE /clientes/:cliente_id/representantes/:id(.:format)                                           clientes/representantes#destroy
#                                          clientes GET    /clientes(.:format)                                                                          clientes#index
#                                                   POST   /clientes(.:format)                                                                          clientes#create
#                                       new_cliente GET    /clientes/new(.:format)                                                                      clientes#new
#                                      edit_cliente GET    /clientes/:id/edit(.:format)                                                                 clientes#edit
#                                           cliente GET    /clientes/:id(.:format)                                                                      clientes#show
#                                                   PATCH  /clientes/:id(.:format)                                                                      clientes#update
#                                                   PUT    /clientes/:id(.:format)                                                                      clientes#update
#                                                   DELETE /clientes/:id(.:format)                                                                      clientes#destroy
#                           dashboard_representante GET    /dashboard/representante(.:format)                                                           dashboard#representante
#                            representante_lojistas GET    /representantes/:representante_id/lojistas(.:format)                                         representantes/lojistas#index
#                                                   POST   /representantes/:representante_id/lojistas(.:format)                                         representantes/lojistas#create
#                         new_representante_lojista GET    /representantes/:representante_id/lojistas/new(.:format)                                     representantes/lojistas#new
#                        edit_representante_lojista GET    /representantes/:representante_id/lojistas/:id/edit(.:format)                                representantes/lojistas#edit
#                             representante_lojista GET    /representantes/:representante_id/lojistas/:id(.:format)                                     representantes/lojistas#show
#                                                   PATCH  /representantes/:representante_id/lojistas/:id(.:format)                                     representantes/lojistas#update
#                                                   PUT    /representantes/:representante_id/lojistas/:id(.:format)                                     representantes/lojistas#update
#                                                   DELETE /representantes/:representante_id/lojistas/:id(.:format)                                     representantes/lojistas#destroy
#                            representante_clientes GET    /representantes/:representante_id/clientes(.:format)                                         representantes/clientes#index
#                                                   POST   /representantes/:representante_id/clientes(.:format)                                         representantes/clientes#create
#                         new_representante_cliente GET    /representantes/:representante_id/clientes/new(.:format)                                     representantes/clientes#new
#                        edit_representante_cliente GET    /representantes/:representante_id/clientes/:id/edit(.:format)                                representantes/clientes#edit
#                             representante_cliente GET    /representantes/:representante_id/clientes/:id(.:format)                                     representantes/clientes#show
#                                                   PATCH  /representantes/:representante_id/clientes/:id(.:format)                                     representantes/clientes#update
#                                                   PUT    /representantes/:representante_id/clientes/:id(.:format)                                     representantes/clientes#update
#                                                   DELETE /representantes/:representante_id/clientes/:id(.:format)                                     representantes/clientes#destroy
#                                    representantes GET    /representantes(.:format)                                                                    representantes#index
#                                                   POST   /representantes(.:format)                                                                    representantes#create
#                                 new_representante GET    /representantes/new(.:format)                                                                representantes#new
#                                edit_representante GET    /representantes/:id/edit(.:format)                                                           representantes#edit
#                                     representante GET    /representantes/:id(.:format)                                                                representantes#show
#                                                   PATCH  /representantes/:id(.:format)                                                                representantes#update
#                                                   PUT    /representantes/:id(.:format)                                                                representantes#update
#                                                   DELETE /representantes/:id(.:format)                                                                representantes#destroy
#                                rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                   active_storage/blobs#show
#                         rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)     active_storage/representations#show
#                                rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                  active_storage/disk#show
#                         update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                          active_storage/disk#update
#                              rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                               active_storage/direct_uploads#create
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
    scope module: :clientes do
      resources :lojistas do
        get "service_area/clientes", to: "clientes#service_area"
      end
      resources :representantes do
        get "service_area/representantes", to: "representantes#service_area"
      end
    end
  end

  #REPRESENTANTES

  ##DASHBOARDS
  get 'dashboard/representante'

  ##RECURSOS
  resources :representantes do
    scope module: 'representantes' do
      resources :lojistas
      resources :clientes
    end
  end

end
