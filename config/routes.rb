# == Route Map
#
#                                    Prefix Verb       URI Pattern                                                                                   Controller#Action
#                       new_usuario_session GET        /usuarios/sign_in(.:format)                                                                   devise/sessions#new
#                           usuario_session POST       /usuarios/sign_in(.:format)                                                                   devise/sessions#create
#                   destroy_usuario_session DELETE     /usuarios/sign_out(.:format)                                                                  devise/sessions#destroy
#                      new_usuario_password GET        /usuarios/password/new(.:format)                                                              devise/passwords#new
#                     edit_usuario_password GET        /usuarios/password/edit(.:format)                                                             devise/passwords#edit
#                          usuario_password PATCH      /usuarios/password(.:format)                                                                  devise/passwords#update
#                                           PUT        /usuarios/password(.:format)                                                                  devise/passwords#update
#                                           POST       /usuarios/password(.:format)                                                                  devise/passwords#create
#               cancel_usuario_registration GET        /usuarios/cancel(.:format)                                                                    usuarios/registrations#cancel
#                  new_usuario_registration GET        /usuarios/sign_up(.:format)                                                                   usuarios/registrations#new
#                 edit_usuario_registration GET        /usuarios/edit(.:format)                                                                      usuarios/registrations#edit
#                      usuario_registration PATCH      /usuarios(.:format)                                                                           usuarios/registrations#update
#                                           PUT        /usuarios(.:format)                                                                           usuarios/registrations#update
#                                           DELETE     /usuarios(.:format)                                                                           usuarios/registrations#destroy
#                                           POST       /usuarios(.:format)                                                                           usuarios/registrations#create
#                 accept_usuario_invitation GET        /usuarios/invitation/accept(.:format)                                                         usuarios/invitations#edit
#                 remove_usuario_invitation GET        /usuarios/invitation/remove(.:format)                                                         usuarios/invitations#destroy
#                    new_usuario_invitation GET        /usuarios/invitation/new(.:format)                                                            usuarios/invitations#new
#                        usuario_invitation PATCH      /usuarios/invitation(.:format)                                                                usuarios/invitations#update
#                                           PUT        /usuarios/invitation(.:format)                                                                usuarios/invitations#update
#                                           POST       /usuarios/invitation(.:format)                                                                usuarios/invitations#create
#                    new_admin_user_session GET        /admin/login(.:format)                                                                        active_admin/devise/sessions#new
#                        admin_user_session POST       /admin/login(.:format)                                                                        active_admin/devise/sessions#create
#                destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                       active_admin/devise/sessions#destroy
#                   new_admin_user_password GET        /admin/password/new(.:format)                                                                 active_admin/devise/passwords#new
#                  edit_admin_user_password GET        /admin/password/edit(.:format)                                                                active_admin/devise/passwords#edit
#                       admin_user_password PATCH      /admin/password(.:format)                                                                     active_admin/devise/passwords#update
#                                           PUT        /admin/password(.:format)                                                                     active_admin/devise/passwords#update
#                                           POST       /admin/password(.:format)                                                                     active_admin/devise/passwords#create
#                                admin_root GET        /admin(.:format)                                                                              admin/dashboard#index
#           batch_action_admin_solicitacoes POST       /admin/solicitacoes/batch_action(.:format)                                                    admin/solicitacoes#batch_action
#                        admin_solicitacoes GET        /admin/solicitacoes(.:format)                                                                 admin/solicitacoes#index
#                batch_action_admin_cidades POST       /admin/cidades/batch_action(.:format)                                                         admin/cidades#batch_action
#                             admin_cidades GET        /admin/cidades(.:format)                                                                      admin/cidades#index
#                                           POST       /admin/cidades(.:format)                                                                      admin/cidades#create
#                          new_admin_cidade GET        /admin/cidades/new(.:format)                                                                  admin/cidades#new
#                         edit_admin_cidade GET        /admin/cidades/:id/edit(.:format)                                                             admin/cidades#edit
#                              admin_cidade GET        /admin/cidades/:id(.:format)                                                                  admin/cidades#show
#                                           PATCH      /admin/cidades/:id(.:format)                                                                  admin/cidades#update
#                                           PUT        /admin/cidades/:id(.:format)                                                                  admin/cidades#update
#                                           DELETE     /admin/cidades/:id(.:format)                                                                  admin/cidades#destroy
#            batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                     admin/admin_users#batch_action
#                         admin_admin_users GET        /admin/admin_users(.:format)                                                                  admin/admin_users#index
#                                           POST       /admin/admin_users(.:format)                                                                  admin/admin_users#create
#                      new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                              admin/admin_users#new
#                     edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                         admin/admin_users#edit
#                          admin_admin_user GET        /admin/admin_users/:id(.:format)                                                              admin/admin_users#show
#                                           PATCH      /admin/admin_users/:id(.:format)                                                              admin/admin_users#update
#                                           PUT        /admin/admin_users/:id(.:format)                                                              admin/admin_users#update
#                                           DELETE     /admin/admin_users/:id(.:format)                                                              admin/admin_users#destroy
#                batch_action_admin_setores POST       /admin/setores/batch_action(.:format)                                                         admin/setores#batch_action
#                             admin_setores GET        /admin/setores(.:format)                                                                      admin/setores#index
#                                           POST       /admin/setores(.:format)                                                                      admin/setores#create
#                           new_admin_setor GET        /admin/setores/new(.:format)                                                                  admin/setores#new
#                          edit_admin_setor GET        /admin/setores/:id/edit(.:format)                                                             admin/setores#edit
#                               admin_setor GET        /admin/setores/:id(.:format)                                                                  admin/setores#show
#                                           PATCH      /admin/setores/:id(.:format)                                                                  admin/setores#update
#                                           PUT        /admin/setores/:id(.:format)                                                                  admin/setores#update
#                                           DELETE     /admin/setores/:id(.:format)                                                                  admin/setores#destroy
#                           admin_dashboard GET        /admin/dashboard(.:format)                                                                    admin/dashboard#index
#                 batch_action_admin_planos POST       /admin/planos/batch_action(.:format)                                                          admin/planos#batch_action
#                              admin_planos GET        /admin/planos(.:format)                                                                       admin/planos#index
#                                           POST       /admin/planos(.:format)                                                                       admin/planos#create
#                           new_admin_plano GET        /admin/planos/new(.:format)                                                                   admin/planos#new
#                          edit_admin_plano GET        /admin/planos/:id/edit(.:format)                                                              admin/planos#edit
#                               admin_plano GET        /admin/planos/:id(.:format)                                                                   admin/planos#show
#                                           PATCH      /admin/planos/:id(.:format)                                                                   admin/planos#update
#                                           PUT        /admin/planos/:id(.:format)                                                                   admin/planos#update
#                                           DELETE     /admin/planos/:id(.:format)                                                                   admin/planos#destroy
#                            admin_comments GET        /admin/comments(.:format)                                                                     admin/comments#index
#                                           POST       /admin/comments(.:format)                                                                     admin/comments#create
#                             admin_comment GET        /admin/comments/:id(.:format)                                                                 admin/comments#show
#                                           DELETE     /admin/comments/:id(.:format)                                                                 admin/comments#destroy
#                         letter_opener_web            /letter_opener/inbox                                                                          LetterOpenerWeb::Engine
#                          principais_index GET        /principais/index(.:format)                                                                   principais#index
#                                      root GET        /                                                                                             principais#index
#  industria_dashboards_mapa_representantes GET        /industrias/:industria_id/dashboards/mapa/representantes(.:format)                            industrias/dashboards#mapa_representantes
#        industria_dashboards_mapa_lojistas GET        /industrias/:industria_id/dashboards/mapa/lojistas(.:format)                                  industrias/dashboards#mapa_lojistas
#                industria_dashboards_geral GET        /industrias/:industria_id/dashboards/geral(.:format)                                          industrias/dashboards#geral
#              industria_dashboards_ranking GET        /industrias/:industria_id/dashboards/ranking(.:format)                                        industrias/dashboards#ranking
#        industria_dashboards_representante GET        /industrias/:industria_id/dashboards/representante/:id(.:format)                              industrias/dashboards#representante
#                        industria_lojistas GET        /industrias/:industria_id/lojistas(.:format)                                                  industrias/lojistas#index
#                                           POST       /industrias/:industria_id/lojistas(.:format)                                                  industrias/lojistas#create
#                     new_industria_lojista GET        /industrias/:industria_id/lojistas/new(.:format)                                              industrias/lojistas#new
#                    edit_industria_lojista GET        /industrias/:industria_id/lojistas/:id/edit(.:format)                                         industrias/lojistas#edit
#                         industria_lojista GET        /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#show
#                                           PATCH      /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#update
#                                           PUT        /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#update
#                                           DELETE     /industrias/:industria_id/lojistas/:id(.:format)                                              industrias/lojistas#destroy
#       industria_representante_desvincular POST       /industrias/:industria_id/representantes/:representante_id/desvincular(.:format)              industrias/representantes#desvincular
#                  industria_representantes GET        /industrias/:industria_id/representantes(.:format)                                            industrias/representantes#index
#                                           POST       /industrias/:industria_id/representantes(.:format)                                            industrias/representantes#create
#               new_industria_representante GET        /industrias/:industria_id/representantes/new(.:format)                                        industrias/representantes#new
#              edit_industria_representante GET        /industrias/:industria_id/representantes/:id/edit(.:format)                                   industrias/representantes#edit
#                   industria_representante GET        /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#show
#                                           PATCH      /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#update
#                                           PUT        /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#update
#                                           DELETE     /industrias/:industria_id/representantes/:id(.:format)                                        industrias/representantes#destroy
#                        industria_produtos GET        /industrias/:industria_id/produtos(.:format)                                                  industrias/produtos#index
#                                           POST       /industrias/:industria_id/produtos(.:format)                                                  industrias/produtos#create
#                     new_industria_produto GET        /industrias/:industria_id/produtos/new(.:format)                                              industrias/produtos#new
#                    edit_industria_produto GET        /industrias/:industria_id/produtos/:id/edit(.:format)                                         industrias/produtos#edit
#                         industria_produto GET        /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#show
#                                           PATCH      /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#update
#                                           PUT        /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#update
#                                           DELETE     /industrias/:industria_id/produtos/:id(.:format)                                              industrias/produtos#destroy
#              industria_solicitacao_status POST       /industrias/:industria_id/solicitacoes/:solicitacao_id/status(.:format)                       industrias/solicitacoes#status
#         industria_solicitacao_comentarios GET        /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios(.:format)                  industrias/comentarios#index
#                                           POST       /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios(.:format)                  industrias/comentarios#create
#      new_industria_solicitacao_comentario GET        /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/new(.:format)              industrias/comentarios#new
#     edit_industria_solicitacao_comentario GET        /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id/edit(.:format)         industrias/comentarios#edit
#          industria_solicitacao_comentario GET        /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#show
#                                           PATCH      /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#update
#                                           PUT        /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#update
#                                           DELETE     /industrias/:industria_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)              industrias/comentarios#destroy
#                    industria_solicitacoes GET        /industrias/:industria_id/solicitacoes(.:format)                                              industrias/solicitacoes#index
#                                           POST       /industrias/:industria_id/solicitacoes(.:format)                                              industrias/solicitacoes#create
#                 new_industria_solicitacao GET        /industrias/:industria_id/solicitacoes/new(.:format)                                          industrias/solicitacoes#new
#                edit_industria_solicitacao GET        /industrias/:industria_id/solicitacoes/:id/edit(.:format)                                     industrias/solicitacoes#edit
#                     industria_solicitacao GET        /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#show
#                                           PATCH      /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#update
#                                           PUT        /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#update
#                                           DELETE     /industrias/:industria_id/solicitacoes/:id(.:format)                                          industrias/solicitacoes#destroy
#                  industria_equipe_membros GET        /equipe/industrias/:industria_id/equipe/membros(.:format)                                     industrias/equipe#index
#                                           POST       /equipe/industrias/:industria_id/equipe/membros(.:format)                                     industrias/equipe#create
#              industria_equipe_membros_new GET        /equipe/industrias/:industria_id/equipe/membros/new(.:format)                                 industrias/equipe#new
#                   industria_equipe_membro GET        /equipe/industrias/:industria_id/equipe/membro/:id(.:format)                                  industrias/equipe#show
#       industria_equipe_membro_desvincular POST       /equipe/industrias/:industria_id/equipe/membro/desvincular/:id(.:format)                      industrias/equipe#desvincular
#                                industrias GET        /industrias(.:format)                                                                         industrias#index
#                                           POST       /industrias(.:format)                                                                         industrias#create
#                             new_industria GET        /industrias/new(.:format)                                                                     industrias#new
#                            edit_industria GET        /industrias/:id/edit(.:format)                                                                industrias#edit
#                                 industria GET        /industrias/:id(.:format)                                                                     industrias#show
#                                           PATCH      /industrias/:id(.:format)                                                                     industrias#update
#                                           PUT        /industrias/:id(.:format)                                                                     industrias#update
#                                           DELETE     /industrias/:id(.:format)                                                                     industrias#destroy
#    representante_dashboards_mapa_lojistas GET        /representantes/:representante_id/dashboards/mapa/lojistas(.:format)                          representantes/dashboards#mapa_lojistas
#            representante_dashboards_geral GET        /representantes/:representante_id/dashboards/geral(.:format)                                  representantes/dashboards#geral
#                    representante_lojistas GET        /representantes/:representante_id/lojistas(.:format)                                          representantes/lojistas#index
#                                           POST       /representantes/:representante_id/lojistas(.:format)                                          representantes/lojistas#create
#                 new_representante_lojista GET        /representantes/:representante_id/lojistas/new(.:format)                                      representantes/lojistas#new
#                edit_representante_lojista GET        /representantes/:representante_id/lojistas/:id/edit(.:format)                                 representantes/lojistas#edit
#                     representante_lojista GET        /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#show
#                                           PATCH      /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#update
#                                           PUT        /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#update
#                                           DELETE     /representantes/:representante_id/lojistas/:id(.:format)                                      representantes/lojistas#destroy
#                  representante_industrias GET        /representantes/:representante_id/industrias(.:format)                                        representantes/industrias#index
#                                           POST       /representantes/:representante_id/industrias(.:format)                                        representantes/industrias#create
#               new_representante_industria GET        /representantes/:representante_id/industrias/new(.:format)                                    representantes/industrias#new
#              edit_representante_industria GET        /representantes/:representante_id/industrias/:id/edit(.:format)                               representantes/industrias#edit
#                   representante_industria GET        /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#show
#                                           PATCH      /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#update
#                                           PUT        /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#update
#                                           DELETE     /representantes/:representante_id/industrias/:id(.:format)                                    representantes/industrias#destroy
#                    representante_produtos GET        /representantes/:representante_id/produtos(.:format)                                          representantes/produtos#index
#                                           POST       /representantes/:representante_id/produtos(.:format)                                          representantes/produtos#create
#                 new_representante_produto GET        /representantes/:representante_id/produtos/new(.:format)                                      representantes/produtos#new
#                edit_representante_produto GET        /representantes/:representante_id/produtos/:id/edit(.:format)                                 representantes/produtos#edit
#                     representante_produto GET        /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#show
#                                           PATCH      /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#update
#                                           PUT        /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#update
#                                           DELETE     /representantes/:representante_id/produtos/:id(.:format)                                      representantes/produtos#destroy
#          representante_solicitacao_status POST       /representantes/:representante_id/solicitacoes/:solicitacao_id/status(.:format)               representantes/solicitacoes#status
#     representante_solicitacao_comentarios GET        /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios(.:format)          representantes/comentarios#index
#                                           POST       /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios(.:format)          representantes/comentarios#create
#  new_representante_solicitacao_comentario GET        /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/new(.:format)      representantes/comentarios#new
# edit_representante_solicitacao_comentario GET        /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id/edit(.:format) representantes/comentarios#edit
#      representante_solicitacao_comentario GET        /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#show
#                                           PATCH      /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#update
#                                           PUT        /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#update
#                                           DELETE     /representantes/:representante_id/solicitacoes/:solicitacao_id/comentarios/:id(.:format)      representantes/comentarios#destroy
#                representante_solicitacoes GET        /representantes/:representante_id/solicitacoes(.:format)                                      representantes/solicitacoes#index
#                                           POST       /representantes/:representante_id/solicitacoes(.:format)                                      representantes/solicitacoes#create
#             new_representante_solicitacao GET        /representantes/:representante_id/solicitacoes/new(.:format)                                  representantes/solicitacoes#new
#            edit_representante_solicitacao GET        /representantes/:representante_id/solicitacoes/:id/edit(.:format)                             representantes/solicitacoes#edit
#                 representante_solicitacao GET        /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#show
#                                           PATCH      /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#update
#                                           PUT        /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#update
#                                           DELETE     /representantes/:representante_id/solicitacoes/:id(.:format)                                  representantes/solicitacoes#destroy
#                       representante_jogos GET        /representantes/:representante_id/jogos(.:format)                                             representantes/jogos#index
#                            representantes GET        /representantes(.:format)                                                                     representantes#index
#                                           POST       /representantes(.:format)                                                                     representantes#create
#                         new_representante GET        /representantes/new(.:format)                                                                 representantes#new
#                        edit_representante GET        /representantes/:id/edit(.:format)                                                            representantes#edit
#                             representante GET        /representantes/:id(.:format)                                                                 representantes#show
#                                           PATCH      /representantes/:id(.:format)                                                                 representantes#update
#                                           PUT        /representantes/:id(.:format)                                                                 representantes#update
#                                           DELETE     /representantes/:id(.:format)                                                                 representantes#destroy
#                        rails_service_blob GET        /rails/active_storage/blobs/:signed_id/*filename(.:format)                                    active_storage/blobs#show
#                 rails_blob_representation GET        /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)      active_storage/representations#show
#                        rails_disk_service GET        /rails/active_storage/disk/:encoded_key/*filename(.:format)                                   active_storage/disk#show
#                 update_rails_disk_service PUT        /rails/active_storage/disk/:encoded_token(.:format)                                           active_storage/disk#update
#                      rails_direct_uploads POST       /rails/active_storage/direct_uploads(.:format)                                                active_storage/direct_uploads#create
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
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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

      resources :pagamentos

      scope 'equipe' do
        get 'equipe/membros', to: "equipe#index"
        post 'equipe/membros', to: "equipe#create"
        get 'equipe/membros/new', to: "equipe#new"
        get 'equipe/membro/:id', to: "equipe#show", as: "equipe_membro"
        post 'equipe/membro/desvincular/:id', to: "equipe#desvincular", as: "equipe_membro_desvincular"
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
