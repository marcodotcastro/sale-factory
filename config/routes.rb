# == Route Map
#
#                                    Prefix Verb   URI Pattern                                                                                   Controller#Action
#                       new_usuario_session GET    /usuarios/sign_in(.:format)                                                                   devise/sessions#new
#                           usuario_session POST   /usuarios/sign_in(.:format)                                                                   devise/sessions#create
#                   destroy_usuario_session DELETE /usuarios/sign_out(.:format)                                                                  devise/sessions#destroy
#                      new_usuario_password GET    /usuarios/password/new(.:format)                                                              devise/passwords#new
#                     edit_usuario_password GET    /usuarios/password/edit(.:format)                                                             devise/passwords#edit
#                          usuario_password PATCH  /usuarios/password(.:format)                                                                  devise/passwords#update
#                                           PUT    /usuarios/password(.:format)                                                                  devise/passwords#update
#                                           POST   /usuarios/password(.:format)                                                                  devise/passwords#create
#               cancel_usuario_registration GET    /usuarios/cancel(.:format)                                                                    usuarios/registrations#cancel
#                  new_usuario_registration GET    /usuarios/sign_up(.:format)                                                                   usuarios/registrations#new
#                 edit_usuario_registration GET    /usuarios/edit(.:format)                                                                      usuarios/registrations#edit
#                      usuario_registration PATCH  /usuarios(.:format)                                                                           usuarios/registrations#update
#                                           PUT    /usuarios(.:format)                                                                           usuarios/registrations#update
#                                           DELETE /usuarios(.:format)                                                                           usuarios/registrations#destroy
#                                           POST   /usuarios(.:format)                                                                           usuarios/registrations#create
#                 accept_usuario_invitation GET    /usuarios/invitation/accept(.:format)                                                         usuarios/invitations#edit
#                 remove_usuario_invitation GET    /usuarios/invitation/remove(.:format)                                                         usuarios/invitations#destroy
#                    new_usuario_invitation GET    /usuarios/invitation/new(.:format)                                                            usuarios/invitations#new
#                        usuario_invitation PATCH  /usuarios/invitation(.:format)                                                                usuarios/invitations#update
#                                           PUT    /usuarios/invitation(.:format)                                                                usuarios/invitations#update
#                                           POST   /usuarios/invitation(.:format)                                                                usuarios/invitations#create
#                                   cidades GET    /cidades(.:format)                                                                            cidades#index
#                                           POST   /cidades(.:format)                                                                            cidades#create
#                                new_cidade GET    /cidades/new(.:format)                                                                        cidades#new
#                               edit_cidade GET    /cidades/:id/edit(.:format)                                                                   cidades#edit
#                                    cidade GET    /cidades/:id(.:format)                                                                        cidades#show
#                                           PATCH  /cidades/:id(.:format)                                                                        cidades#update
#                                           PUT    /cidades/:id(.:format)                                                                        cidades#update
#                                           DELETE /cidades/:id(.:format)                                                                        cidades#destroy
#                         letter_opener_web        /letter_opener/inbox                                                                          LetterOpenerWeb::Engine
#                          principais_index GET    /principais/index(.:format)                                                                   principais#index
#                                      root GET    /                                                                                             principais#index
#  industria_dashboards_mapa_representantes GET    /industrias/:industria_id/dashboards/mapa/representantes(.:format)                            industrias/dashboards#mapa_representantes
#        industria_dashboards_mapa_lojistas GET    /industrias/:industria_id/dashboards/mapa/lojistas(.:format)                                  industrias/dashboards#mapa_lojistas
#                industria_dashboards_geral GET    /industrias/:industria_id/dashboards/geral(.:format)                                          industrias/dashboards#geral
#              industria_dashboards_ranking GET    /industrias/:industria_id/dashboards/ranking(.:format)                                        industrias/dashboards#ranking
#        industria_dashboards_representante GET    /industrias/:industria_id/dashboards/representante/:id(.:format)                              industrias/dashboards#representante
#                        industria_lojistas GET    /industrias/:industria_id/lojistas(.:format)                                                  industrias/lojistas#index
#                                           POST   /industrias/:industria_id/lojistas(.:format)                                                  industrias/lojistas#create
#                     new_industria_lojista GET    /industrias/:industria_id/lojistas/new(.:format)                                              industrias/lojistas#new
#                    edit_industria_lojista GET    /industrias/:industria_id/lojistas/:id/edit(.:format)                                         industrias/lojistas#edit
#                         industria_lojista GET    /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#show
#                                           PATCH  /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#update
#                                           PUT    /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#update
#                                           DELETE /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#destroy
#       industria_representante_desvincular POST   /industrias/:industria_id/representantes/:representante_id/desvincular(.:format)              industrias/representantes#desvincular
#                  industria_representantes GET    /industrias/:industria_id/representantes(.:format)                                            industrias/representantes#index
#                                           POST   /industrias/:industria_id/representantes(.:format)                                            industrias/representantes#create
#               new_industria_representante GET    /industrias/:industria_id/representantes/new(.:format)                                        industrias/representantes#new
#              edit_industria_representante GET    /industrias/:industria_id/representantes/:id/edit(.:format)                                   industrias/representantes#edit
#                   industria_representante GET    /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#show
#                                           PATCH  /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#update
#                                           PUT    /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#update
#                                           DELETE /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#destroy
#                        industria_produtos GET    /industrias/:industria_id/produtos(.:format)                                                  industrias/produtos#index
#                                           POST   /industrias/:industria_id/produtos(.:format)                                                  industrias/produtos#create
#                     new_industria_produto GET    /industrias/:industria_id/produtos/new(.:format)                                              industrias/produtos#new
#                    edit_industria_produto GET    /industrias/:industria_id/produtos/:id/edit(.:format)                                         industrias/produtos#edit
#                         industria_produto GET    /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#show
#                                           PATCH  /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#update
#                                           PUT    /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#update
#                                           DELETE /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#destroy
#              industria_solicitacao_status POST   /industrias/:industria_id/solicitacoes/:solicitacao_id/status(.:format)                       industrias/solicitacoes#status
#         industria_solicitacao_comentarios GET    /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios(.:format)                  industrias/comentarios#index
#                                           POST   /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios(.:format)                  industrias/comentarios#create
#      new_industria_solicitacao_comentario GET    /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/new(.:format)              industrias/comentarios#new
#     edit_industria_solicitacao_comentario GET    /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id/edit(.:format)         industrias/comentarios#edit
#          industria_solicitacao_comentario GET    /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#show
#                                           PATCH  /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#update
#                                           PUT    /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#update
#                                           DELETE /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#destroy
#                    industria_solicitacoes GET    /industrias/:industria_id/solicitacoes(.:format)                                              industrias/solicitacoes#index
#                                           POST   /industrias/:industria_id/solicitacoes(.:format)                                              industrias/solicitacoes#create
#                 new_industria_solicitacao GET    /industrias/:industria_id/solicitacoes/new(.:format)                                          industrias/solicitacoes#new
#                edit_industria_solicitacao GET    /industrias/:industria_id/solicitacoes/:id/edit(.:format)                                     industrias/solicitacoes#edit
#                     industria_solicitacao GET    /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#show
#                                           PATCH  /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#update
#                                           PUT    /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#update
#                                           DELETE /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#destroy
#                                industrias GET    /industrias(.:format)                                                                         industrias#index
#                                           POST   /industrias(.:format)                                                                         industrias#create
#                             new_industria GET    /industrias/new(.:format)                                                                     industrias#new
#                            edit_industria GET    /industrias/:id/edit(.:format)                                                                industrias#edit
#                                 industria GET    /industrias/:id(.:format)                                                                     industrias#show
#                                           PATCH  /industrias/:id(.:format)                                                                     industrias#update
#                                           PUT    /industrias/:id(.:format)                                                                     industrias#update
#                                           DELETE /industrias/:id(.:format)                                                                     industrias#destroy
#    representante_dashboards_mapa_lojistas GET    /representantes/:representante_id/dashboards/mapa/lojistas(.:format)                          representantes/dashboards#mapa_lojistas
#            representante_dashboards_geral GET    /representantes/:representante_id/dashboards/geral(.:format)                                  representantes/dashboards#geral
#                    representante_lojistas GET    /representantes/:representante_id/lojistas(.:format)                                          representantes/lojistas#index
#                                           POST   /representantes/:representante_id/lojistas(.:format)                                          representantes/lojistas#create
#                 new_representante_lojista GET    /representantes/:representante_id/lojistas/new(.:format)                                      representantes/lojistas#new
#                edit_representante_lojista GET    /representantes/:representante_id/lojistas/:id/edit(.:format)                                 representantes/lojistas#edit
#                     representante_lojista GET    /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#show
#                                           PATCH  /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#update
#                                           PUT    /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#update
#                                           DELETE /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#destroy
#                  representante_industrias GET    /representantes/:representante_id/industrias(.:format)                                        representantes/industrias#index
#                                           POST   /representantes/:representante_id/industrias(.:format)                                        representantes/industrias#create
#               new_representante_industria GET    /representantes/:representante_id/industrias/new(.:format)                                    representantes/industrias#new
#              edit_representante_industria GET    /representantes/:representante_id/industrias/:id/edit(.:format)                               representantes/industrias#edit
#                   representante_industria GET    /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#show
#                                           PATCH  /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#update
#                                           PUT    /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#update
#                                           DELETE /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#destroy
#                    representante_produtos GET    /representantes/:representante_id/produtos(.:format)                                          representantes/produtos#index
#                                           POST   /representantes/:representante_id/produtos(.:format)                                          representantes/produtos#create
#                 new_representante_produto GET    /representantes/:representante_id/produtos/new(.:format)                                      representantes/produtos#new
#                edit_representante_produto GET    /representantes/:representante_id/produtos/:id/edit(.:format)                                 representantes/produtos#edit
#                     representante_produto GET    /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#show
#                                           PATCH  /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#update
#                                           PUT    /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#update
#                                           DELETE /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#destroy
#          representante_solicitacao_status POST   /representantes/:representante_id/solicitacoes/:solicitacao_id/status(.:format)               representantes/solicitacoes#status
#     representante_solicitacao_comentarios GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios(.:format)          representantes/comentarios#index
#                                           POST   /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios(.:format)          representantes/comentarios#create
#  new_representante_solicitacao_comentario GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/new(.:format)      representantes/comentarios#new
# edit_representante_solicitacao_comentario GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id/edit(.:format) representantes/comentarios#edit
#      representante_solicitacao_comentario GET    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#show
#                                           PATCH  /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#update
#                                           PUT    /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#update
#                                           DELETE /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#destroy
#                representante_solicitacoes GET    /representantes/:representante_id/solicitacoes(.:format)                                      representantes/solicitacoes#index
#                                           POST   /representantes/:representante_id/solicitacoes(.:format)                                      representantes/solicitacoes#create
#             new_representante_solicitacao GET    /representantes/:representante_id/solicitacoes/new(.:format)                                  representantes/solicitacoes#new
#            edit_representante_solicitacao GET    /representantes/:representante_id/solicitacoes/:id/edit(.:format)                             representantes/solicitacoes#edit
#                 representante_solicitacao GET    /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#show
#                                           PATCH  /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#update
#                                           PUT    /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#update
#                                           DELETE /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#destroy
#                       representante_jogos GET    /representantes/:representante_id/jogos(.:format)                                             representantes/jogos#index
#                            representantes GET    /representantes(.:format)                                                                     representantes#index
#                                           POST   /representantes(.:format)                                                                     representantes#create
#                         new_representante GET    /representantes/new(.:format)                                                                 representantes#new
#                        edit_representante GET    /representantes/:id/edit(.:format)                                                            representantes#edit
#                             representante GET    /representantes/:id(.:format)                                                                 representantes#show
#                                           PATCH  /representantes/:id(.:format)                                                                 representantes#update
#                                           PUT    /representantes/:id(.:format)                                                                 representantes#update
#                                           DELETE /representantes/:id(.:format)                                                                 representantes#destroy
#                        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                    active_storage/blobs#show
#                 rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)      active_storage/representations#show
#                        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                   active_storage/disk#show
#                 update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                           active_storage/disk#update
#                      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                active_storage/direct_uploads#create
# 
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  resources :industrias do
    scope module: :industrias do
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
      get "dashboards/mapa/lojistas", to: "dashboards#mapa_lojistas"
      get "dashboards/geral", to: "dashboards#geral"

      ##RECURSOS
      resources :lojistas
      resources :industrias
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
