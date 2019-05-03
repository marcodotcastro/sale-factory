# == Route Map
#
#                                       Prefix Verb   URI Pattern                                                                                   Controller#Action
#                          new_usuario_session GET    /usuarios/sign_in(.:format)                                                                   devise/sessions#new
#                              usuario_session POST   /usuarios/sign_in(.:format)                                                                   devise/sessions#create
#                      destroy_usuario_session DELETE /usuarios/sign_out(.:format)                                                                  devise/sessions#destroy
#                         new_usuario_password GET    /usuarios/password/new(.:format)                                                              devise/passwords#new
#                        edit_usuario_password GET    /usuarios/password/edit(.:format)                                                             devise/passwords#edit
#                             usuario_password PATCH  /usuarios/password(.:format)                                                                  devise/passwords#update
#                                              PUT    /usuarios/password(.:format)                                                                  devise/passwords#update
#                                              POST   /usuarios/password(.:format)                                                                  devise/passwords#create
#                  cancel_usuario_registration GET    /usuarios/cancel(.:format)                                                                    usuarios/registrations#cancel
#                     new_usuario_registration GET    /usuarios/sign_up(.:format)                                                                   usuarios/registrations#new
#                    edit_usuario_registration GET    /usuarios/edit(.:format)                                                                      usuarios/registrations#edit
#                         usuario_registration PATCH  /usuarios(.:format)                                                                           usuarios/registrations#update
#                                              PUT    /usuarios(.:format)                                                                           usuarios/registrations#update
#                                              DELETE /usuarios(.:format)                                                                           usuarios/registrations#destroy
#                                              POST   /usuarios(.:format)                                                                           usuarios/registrations#create
#                    accept_usuario_invitation GET    /usuarios/invitation/accept(.:format)                                                         usuarios/invitations#edit
#                    remove_usuario_invitation GET    /usuarios/invitation/remove(.:format)                                                         usuarios/invitations#destroy
#                       new_usuario_invitation GET    /usuarios/invitation/new(.:format)                                                            usuarios/invitations#new
#                           usuario_invitation PATCH  /usuarios/invitation(.:format)                                                                usuarios/invitations#update
#                                              PUT    /usuarios/invitation(.:format)                                                                usuarios/invitations#update
#                                              POST   /usuarios/invitation(.:format)                                                                usuarios/invitations#create
#                                      cidades GET    /cidades(.:format)                                                                            cidades#index
#                                              POST   /cidades(.:format)                                                                            cidades#create
#                                   new_cidade GET    /cidades/new(.:format)                                                                        cidades#new
#                                  edit_cidade GET    /cidades/:id/edit(.:format)                                                                   cidades#edit
#                                       cidade GET    /cidades/:id(.:format)                                                                        cidades#show
#                                              PATCH  /cidades/:id(.:format)                                                                        cidades#update
#                                              PUT    /cidades/:id(.:format)                                                                        cidades#update
#                                              DELETE /cidades/:id(.:format)                                                                        cidades#destroy
#                            letter_opener_web        /letter_opener/inbox                                                                          LetterOpenerWeb::Engine
#                             principais_index GET    /principais/index(.:format)                                                                   principais#index
#                                         root GET    /                                                                                             principais#index
#       cliente_dashboards_mapa_representantes GET    /clientes/:cliente_id/dashboards/mapa/representantes(.:format)                                clientes/dashboards#mapa_representantes
#             cliente_dashboards_mapa_lojistas GET    /clientes/:cliente_id/dashboards/mapa/lojistas(.:format)                                      clientes/dashboards#mapa_lojistas
#                     cliente_dashboards_geral GET    /clientes/:cliente_id/dashboards/geral(.:format)                                              clientes/dashboards#geral
#                   cliente_dashboards_ranking GET    /clientes/:cliente_id/dashboards/ranking(.:format)                                            clientes/dashboards#ranking
#             cliente_dashboards_representante GET    /clientes/:cliente_id/dashboards/representante/:id(.:format)                                  clientes/dashboards#representante
#                             cliente_lojistas GET    /clientes/:cliente_id/lojistas(.:format)                                                      clientes/lojistas#index
#                                              POST   /clientes/:cliente_id/lojistas(.:format)                                                      clientes/lojistas#create
#                          new_cliente_lojista GET    /clientes/:cliente_id/lojistas/new(.:format)                                                  clientes/lojistas#new
#                         edit_cliente_lojista GET    /clientes/:cliente_id/lojistas/:id/edit(.:format)                                             clientes/lojistas#edit
#                              cliente_lojista GET    /clientes/:cliente_id/lojistas/:id(.:format)                                                  clientes/lojistas#show
#                                              PATCH  /clientes/:cliente_id/lojistas/:id(.:format)                                                  clientes/lojistas#update
#                                              PUT    /clientes/:cliente_id/lojistas/:id(.:format)                                                  clientes/lojistas#update
#                                              DELETE /clientes/:cliente_id/lojistas/:id(.:format)                                                  clientes/lojistas#destroy
#            cliente_representante_desvincular POST   /clientes/:cliente_id/representantes/:representante_id/desvincular(.:format)                  clientes/representantes#desvincular
#                       cliente_representantes GET    /clientes/:cliente_id/representantes(.:format)                                                clientes/representantes#index
#                                              POST   /clientes/:cliente_id/representantes(.:format)                                                clientes/representantes#create
#                    new_cliente_representante GET    /clientes/:cliente_id/representantes/new(.:format)                                            clientes/representantes#new
#                   edit_cliente_representante GET    /clientes/:cliente_id/representantes/:id/edit(.:format)                                       clientes/representantes#edit
#                        cliente_representante GET    /clientes/:cliente_id/representantes/:id(.:format)                                            clientes/representantes#show
#                                              PATCH  /clientes/:cliente_id/representantes/:id(.:format)                                            clientes/representantes#update
#                                              PUT    /clientes/:cliente_id/representantes/:id(.:format)                                            clientes/representantes#update
#                                              DELETE /clientes/:cliente_id/representantes/:id(.:format)                                            clientes/representantes#destroy
#                             cliente_produtos GET    /clientes/:cliente_id/produtos(.:format)                                                      clientes/produtos#index
#                                              POST   /clientes/:cliente_id/produtos(.:format)                                                      clientes/produtos#create
#                          new_cliente_produto GET    /clientes/:cliente_id/produtos/new(.:format)                                                  clientes/produtos#new
#                         edit_cliente_produto GET    /clientes/:cliente_id/produtos/:id/edit(.:format)                                             clientes/produtos#edit
#                              cliente_produto GET    /clientes/:cliente_id/produtos/:id(.:format)                                                  clientes/produtos#show
#                                              PATCH  /clientes/:cliente_id/produtos/:id(.:format)                                                  clientes/produtos#update
#                                              PUT    /clientes/:cliente_id/produtos/:id(.:format)                                                  clientes/produtos#update
#                                              DELETE /clientes/:cliente_id/produtos/:id(.:format)                                                  clientes/produtos#destroy
#                   cliente_solicitacao_status POST   /clientes/:cliente_id/solicitacoes/:solicitacao_id/status(.:format)                           clientes/solicitacoes#status
#              cliente_solicitacao_comentarios GET    /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios(.:format)                      clientes/comentarios#index
#                                              POST   /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios(.:format)                      clientes/comentarios#create
#           new_cliente_solicitacao_comentario GET    /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios/new(.:format)                  clientes/comentarios#new
#          edit_cliente_solicitacao_comentario GET    /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios/:id/edit(.:format)             clientes/comentarios#edit
#               cliente_solicitacao_comentario GET    /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)                  clientes/comentarios#show
#                                              PATCH  /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)                  clientes/comentarios#update
#                                              PUT    /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)                  clientes/comentarios#update
#                                              DELETE /clientes/:cliente_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)                  clientes/comentarios#destroy
#                         cliente_solicitacoes GET    /clientes/:cliente_id/solicitacoes(.:format)                                                  clientes/solicitacoes#index
#                                              POST   /clientes/:cliente_id/solicitacoes(.:format)                                                  clientes/solicitacoes#create
#                      new_cliente_solicitacao GET    /clientes/:cliente_id/solicitacoes/new(.:format)                                              clientes/solicitacoes#new
#                     edit_cliente_solicitacao GET    /clientes/:cliente_id/solicitacoes/:id/edit(.:format)                                         clientes/solicitacoes#edit
#                          cliente_solicitacao GET    /clientes/:cliente_id/solicitacoes/:id(.:format)                                              clientes/solicitacoes#show
#                                              PATCH  /clientes/:cliente_id/solicitacoes/:id(.:format)                                              clientes/solicitacoes#update
#                                              PUT    /clientes/:cliente_id/solicitacoes/:id(.:format)                                              clientes/solicitacoes#update
#                                              DELETE /clientes/:cliente_id/solicitacoes/:id(.:format)                                              clientes/solicitacoes#destroy
#                                     clientes GET    /clientes(.:format)                                                                           clientes#index
#                                              POST   /clientes(.:format)                                                                           clientes#create
#                                  new_cliente GET    /clientes/new(.:format)                                                                       clientes#new
#                                 edit_cliente GET    /clientes/:id/edit(.:format)                                                                  clientes#edit
#                                      cliente GET    /clientes/:id(.:format)                                                                       clientes#show
#                                              PATCH  /clientes/:id(.:format)                                                                       clientes#update
#                                              PUT    /clientes/:id(.:format)                                                                       clientes#update
#                                              DELETE /clientes/:id(.:format)                                                                       clientes#destroy
# representante_dashboards_mapa_representantes GET    /representantes/:representante_id/dashboards/mapa/representantes(.:format)                    representantes/dashboards#mapa_representantes
#       representante_dashboards_mapa_lojistas GET    /representantes/:representante_id/dashboards/mapa/lojistas(.:format)                          representantes/dashboards#mapa_lojistas
#               representante_dashboards_geral GET    /representantes/:representante_id/dashboards/geral(.:format)                                  representantes/dashboards#geral
#             representante_dashboards_ranking GET    /representantes/:representante_id/dashboards/ranking(.:format)                                representantes/dashboards#ranking
#      representante_dashboards_ranking_membro GET    /representantes/:representante_id/dashboards/ranking/membro(.:format)                         representantes/dashboards#membro
#             representante_dashboards_lojista GET    /representantes/:representante_id/dashboards/lojista/:id(.:format)                            representantes/dashboards#lojista
#                       representante_lojistas GET    /representantes/:representante_id/lojistas(.:format)                                          representantes/lojistas#index
#                                              POST   /representantes/:representante_id/lojistas(.:format)                                          representantes/lojistas#create
#                    new_representante_lojista GET    /representantes/:representante_id/lojistas/new(.:format)                                      representantes/lojistas#new
#                   edit_representante_lojista GET    /representantes/:representante_id/lojistas/:id/edit(.:format)                                 representantes/lojistas#edit
#                        representante_lojista GET    /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#show
#                                              PATCH  /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#update
#                                              PUT    /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#update
#                                              DELETE /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#destroy
#                       representante_clientes GET    /representantes/:representante_id/clientes(.:format)                                          representantes/clientes#index
#                                              POST   /representantes/:representante_id/clientes(.:format)                                          representantes/clientes#create
#                    new_representante_cliente GET    /representantes/:representante_id/clientes/new(.:format)                                      representantes/clientes#new
#                   edit_representante_cliente GET    /representantes/:representante_id/clientes/:id/edit(.:format)                                 representantes/clientes#edit
#                        representante_cliente GET    /representantes/:representante_id/clientes/:id(.:format)                                      representantes/clientes#show
#                                              PATCH  /representantes/:representante_id/clientes/:id(.:format)                                      representantes/clientes#update
#                                              PUT    /representantes/:representante_id/clientes/:id(.:format)                                      representantes/clientes#update
#                                              DELETE /representantes/:representante_id/clientes/:id(.:format)                                      representantes/clientes#destroy
#                       representante_produtos GET    /representantes/:representante_id/produtos(.:format)                                          representantes/produtos#index
#                                              POST   /representantes/:representante_id/produtos(.:format)                                          representantes/produtos#create
#                    new_representante_produto GET    /representantes/:representante_id/produtos/new(.:format)                                      representantes/produtos#new
#                   edit_representante_produto GET    /representantes/:representante_id/produtos/:id/edit(.:format)                                 representantes/produtos#edit
#                        representante_produto GET    /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#show
#                                              PATCH  /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#update
#                                              PUT    /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#update
#                                              DELETE /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#destroy
#             representante_solicitacao_status POST   /representantes/:representante_id/solicitacoes/:solicitacao_id/status(.:format)               representantes/solicitacoes#status
#        representante_solicitacao_comentarios GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios(.:format)          representantes/comentarios#index
#                                              POST   /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios(.:format)          representantes/comentarios#create
#     new_representante_solicitacao_comentario GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/new(.:format)      representantes/comentarios#new
#    edit_representante_solicitacao_comentario GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id/edit(.:format) representantes/comentarios#edit
#         representante_solicitacao_comentario GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#show
#                                              PATCH  /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#update
#                                              PUT    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#update
#                                              DELETE /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#destroy
#                   representante_solicitacoes GET    /representantes/:representante_id/solicitacoes(.:format)                                      representantes/solicitacoes#index
#                                              POST   /representantes/:representante_id/solicitacoes(.:format)                                      representantes/solicitacoes#create
#                new_representante_solicitacao GET    /representantes/:representante_id/solicitacoes/new(.:format)                                  representantes/solicitacoes#new
#               edit_representante_solicitacao GET    /representantes/:representante_id/solicitacoes/:id/edit(.:format)                             representantes/solicitacoes#edit
#                    representante_solicitacao GET    /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#show
#                                              PATCH  /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#update
#                                              PUT    /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#update
#                                              DELETE /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#destroy
#                          representante_jogos GET    /representantes/:representante_id/jogos(.:format)                                             representantes/jogos#index
#                               representantes GET    /representantes(.:format)                                                                     representantes#index
#                                              POST   /representantes(.:format)                                                                     representantes#create
#                            new_representante GET    /representantes/new(.:format)                                                                 representantes#new
#                           edit_representante GET    /representantes/:id/edit(.:format)                                                            representantes#edit
#                                representante GET    /representantes/:id(.:format)                                                                 representantes#show
#                                              PATCH  /representantes/:id(.:format)                                                                 representantes#update
#                                              PUT    /representantes/:id(.:format)                                                                 representantes#update
#                                              DELETE /representantes/:id(.:format)                                                                 representantes#destroy
#                           rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                    active_storage/blobs#show
#                    rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)      active_storage/representations#show
#                           rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                   active_storage/disk#show
#                    update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                           active_storage/disk#update
#                         rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                active_storage/direct_uploads#create
# 
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  #ADMINISTRAÇÃO
  devise_for :usuarios, :controllers => {invitations: 'usuarios/invitations', registrations: 'usuarios/registrations', confirmations: 'usuarios/confirmations'}

  resources :cidades

  #DESENVOLVIVMENTO
  default_url_options :host => "localhost:3000"

  mount LetterOpenerWeb::Engine, at: "/letter_opener/inbox" if Rails.env.development?

  #TODOS
  get 'principais/index'
  root to: 'principais#index'

  #CLIENTES
  resources :clientes do
    scope module: :clientes do
      ##DASHBOARDS

      get "dashboards/mapa/representantes", to: "dashboards#mapa_representantes"
      get "dashboards/mapa/lojistas", to: "dashboards#mapa_lojistas"
      get "dashboards/geral", to: "dashboards#geral"
      get "dashboards/ranking", to: "dashboards#ranking"
      get "dashboards/representante/:id", to: "dashboards#representante", as: "dashboards_representante"

      ##RECURSOS

      resources :lojistas
      resources :representantes do
        post "desvincular", to: "representantes#desvincular"
      end
      resources :produtos
      resources :solicitacoes do
        post "status", to: "status"
        resources :comentarios
      end
    end
  end

  #REPRESENTANTES
  resources :representantes do
    scope module: 'representantes' do
      ##DASHBOARDS
      get "dashboards/mapa/representantes", to: "dashboards#mapa_representantes"
      get "dashboards/mapa/lojistas", to: "dashboards#mapa_lojistas"
      get "dashboards/geral", to: "dashboards#geral"
      get "dashboards/ranking", to: "dashboards#ranking"
      get "dashboards/ranking/membro", to: "dashboards#membro"
      get "dashboards/lojista/:id", to: "dashboards#lojista", as: "dashboards_lojista"

      ##RECURSOS
      resources :lojistas
      resources :clientes
      resources :produtos
      resources :solicitacoes do
        post "status", to: "status"
        resources :comentarios
      end

      ##JOGO
      get "jogos", to: "jogos#index"
    end
  end

end
