Rails.application.routes.draw do
 


 # Do booksmarks need to go under the createBookmark routes?
 # double check that create update destroy uses the user_id

  resources :user do
    resources :booksmarks, shallow: true
    resources :categorybookmarks, shallow: true
  end

end


# user_booksmarks GET    /user/:user_id/booksmarks(.:format)            booksmarks#index
#                           POST   /user/:user_id/booksmarks(.:format)            booksmarks#create
#        new_user_booksmark GET    /user/:user_id/booksmarks/new(.:format)        booksmarks#new
#            edit_booksmark GET    /booksmarks/:id/edit(.:format)                 booksmarks#edit
#                 booksmark GET    /booksmarks/:id(.:format)                      booksmarks#show
#                           PATCH  /booksmarks/:id(.:format)                      booksmarks#update
#                           PUT    /booksmarks/:id(.:format)                      booksmarks#update
#                           DELETE /booksmarks/:id(.:format)                      booksmarks#destroy
#    user_categorybookmarks GET    /user/:user_id/categorybookmarks(.:format)     categorybookmarks#index
#                           POST   /user/:user_id/categorybookmarks(.:format)     categorybookmarks#create
# new_user_categorybookmark GET    /user/:user_id/categorybookmarks/new(.:format) categorybookmarks#new
#     edit_categorybookmark GET    /categorybookmarks/:id/edit(.:format)          categorybookmarks#edit
#          categorybookmark GET    /categorybookmarks/:id(.:format)               categorybookmarks#show
#                           PATCH  /categorybookmarks/:id(.:format)               categorybookmarks#update
#                           PUT    /categorybookmarks/:id(.:format)               categorybookmarks#update
#                           DELETE /categorybookmarks/:id(.:format)               categorybookmarks#destroy
#                user_index GET    /user(.:format)                                user#index
#                           POST   /user(.:format)                                user#create
#                  new_user GET    /user/new(.:format)                            user#new
#                 edit_user GET    /user/:id/edit(.:format)                       user#edit
#                      user GET    /user/:id(.:format)                            user#show
#                           PATCH  /user/:id(.:format)                            user#update
#                           PUT    /user/:id(.:format)                            user#update
#                           DELETE /user/:id(.:format)                            user#destroy