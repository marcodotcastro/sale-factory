# == Route Map
#
#                       Prefix Verb   URI Pattern                                                                              Controller#Action
#              representatives GET    /representatives(.:format)                                                               representatives#index
#                              POST   /representatives(.:format)                                                               representatives#create
#           new_representative GET    /representatives/new(.:format)                                                           representatives#new
#          edit_representative GET    /representatives/:id/edit(.:format)                                                      representatives#edit
#               representative GET    /representatives/:id(.:format)                                                           representatives#show
#                              PATCH  /representatives/:id(.:format)                                                           representatives#update
#                              PUT    /representatives/:id(.:format)                                                           representatives#update
#                              DELETE /representatives/:id(.:format)                                                           representatives#destroy
# service_area_representatives GET    /service_area/representatives(.:format)                                                  representatives#service_account
#           rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#    rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#           rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#    update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#         rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :representatives
  get "service_account/representatives", to: "representatives#service_account"
  get "service_area/representatives", to: "representatives#service_area"
end
