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
#                                           cidades GET    /cidades(.:format)                                                                           cidades#index
#                                                   POST   /cidades(.:format)                                                                           cidades#create
#                                        new_cidade GET    /cidades/new(.:format)                                                                       cidades#new
#                                       edit_cidade GET    /cidades/:id/edit(.:format)                                                                  cidades#edit
#                                            cidade GET    /cidades/:id(.:format)                                                                       cidades#show
#                                                   PATCH  /cidades/:id(.:format)                                                                       cidades#update
#                                                   PUT    /cidades/:id(.:format)                                                                       cidades#update
#                                                   DELETE /cidades/:id(.:format)                                                                       cidades#destroy
#                                 letter_opener_web        /letter_opener/inbox                                                                         LetterOpenerWeb::Engine
#                                  principais_index GET    /principais/index(.:format)                                                                  principais#index
#                                              root GET    /                                                                                            principais#index
#                          cliente_dashboards_geral GET    /clientes/:cliente_id/dashboards/geral(.:format)                                             clientes/dashboards#geral
#                        cliente_dashboards_ranking GET    /clientes/:cliente_id/dashboards/ranking(.:format)                                           clientes/dashboards#ranking
#                  cliente_dashboards_representante GET    /clientes/:cliente_id/dashboards/representante/:id(.:format)                                 clientes/dashboards#representante
#                                          clientes GET    /clientes(.:format)                                                                          clientes#index
#                                                   POST   /clientes(.:format)                                                                          clientes#create
#                                       new_cliente GET    /clientes/new(.:format)                                                                      clientes#new
#                                      edit_cliente GET    /clientes/:id/edit(.:format)                                                                 clientes#edit
#                                           cliente GET    /clientes/:id(.:format)                                                                      clientes#show
#                                                   PATCH  /clientes/:id(.:format)                                                                      clientes#update
#                                                   PUT    /clientes/:id(.:format)                                                                      clientes#update
#                                                   DELETE /clientes/:id(.:format)                                                                      clientes#destroy
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
#                                                   GET    /clientes(.:format)                                                                          clientes#index
#                                                   POST   /clientes(.:format)                                                                          clientes#create
#                                                   GET    /clientes/new(.:format)                                                                      clientes#new
#                                                   GET    /clientes/:id/edit(.:format)                                                                 clientes#edit
#                                                   GET    /clientes/:id(.:format)                                                                      clientes#show
#                                                   PATCH  /clientes/:id(.:format)                                                                      clientes#update
#                                                   PUT    /clientes/:id(.:format)                                                                      clientes#update
#                                                   DELETE /clientes/:id(.:format)                                                                      clientes#destroy
#                    representante_dashboards_geral GET    /representantes/:representante_id/dashboards/geral(.:format)                                 representantes/dashboards#geral
#                  representante_dashboards_ranking GET    /representantes/:representante_id/dashboards/ranking(.:format)                               representantes/dashboards#ranking
#           representante_dashboards_ranking_membro GET    /representantes/:representante_id/dashboards/ranking/membro(.:format)                        representantes/dashboards#membro
#                  representante_dashboards_lojista GET    /representantes/:representante_id/dashboards/lojista/:id(.:format)                           representantes/dashboards#lojista
#                                    representantes GET    /representantes(.:format)                                                                    representantes#index
#                                                   POST   /representantes(.:format)                                                                    representantes#create
#                                 new_representante GET    /representantes/new(.:format)                                                                representantes#new
#                                edit_representante GET    /representantes/:id/edit(.:format)                                                           representantes#edit
#                                     representante GET    /representantes/:id(.:format)                                                                representantes#show
#                                                   PATCH  /representantes/:id(.:format)                                                                representantes#update
#                                                   PUT    /representantes/:id(.:format)                                                                representantes#update
#                                                   DELETE /representantes/:id(.:format)                                                                representantes#destroy
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
#                                                   GET    /representantes(.:format)                                                                    representantes#index
#                                                   POST   /representantes(.:format)                                                                    representantes#create
#                                                   GET    /representantes/new(.:format)                                                                representantes#new
#                                                   GET    /representantes/:id/edit(.:format)                                                           representantes#edit
#                                                   GET    /representantes/:id(.:format)                                                                representantes#show
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

  resources :cidades

  #DESENVOLVIVMENTO
  default_url_options :host => "localhost:3000"

  mount LetterOpenerWeb::Engine, at: "/letter_opener/inbox" if Rails.env.development?

  #TODOS
  get 'principais/index'
  root to: 'principais#index'


  #CLIENTES
  ##DASHBOARDS
  resources :clientes do
    scope module: :clientes do
      get "dashboards/mapa/representantes", to: "dashboards#mapa_representantes"
      get "dashboards/mapa/lojistas", to: "dashboards#mapa_lojistas"
      get "dashboards/geral", to: "dashboards#geral"
      get "dashboards/ranking", to: "dashboards#ranking"
      get "dashboards/representante/:id", to: "dashboards#representante", as: "dashboards_representante"
    end
  end
  ##RECURSOS
  resources :clientes do
    scope module: :clientes do
      resources :lojistas
      resources :representantes
      resources :produtos
    end
  end

  #REPRESENTANTES
  ##DASHBOARDS
  resources :representantes do
    scope module: 'representantes' do
      get "dashboards/mapa/representantes", to: "dashboards#mapa_representantes"
      get "dashboards/mapa/lojistas", to: "dashboards#mapa_lojistas"
      get "dashboards/geral", to: "dashboards#geral"
      get "dashboards/ranking", to: "dashboards#ranking"
      get "dashboards/ranking/membro", to: "dashboards#membro"
      get "dashboards/lojista/:id", to: "dashboards#lojista", as: "dashboards_lojista"
    end
  end
  ##RECURSOS
  resources :representantes do
    scope module: 'representantes' do
      resources :lojistas
      resources :clientes
      resources :produtos
    end
  end

end
