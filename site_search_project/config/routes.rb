Rails.application.routes.draw do
 

	get '/login', to: "sessions#login", as: 'login'
	get '/signup', to: "sessions#signup", as: 'signup'
	post '/login', to: "sessions#attempt_login"
	post '/signup', to: "sessions#create"
	get '/home', to: "sessions#index", as: 'home'
	delete '/logout', to: "sessions#logout", as: "logout"



  

 # Do booksmarks need to go under the createBookmark routes?
 # double check that create update destroy uses the user_id
 root "users#index"

  # resources :users do
    resources :bookmarks, shallow: true
    resources :category_bookmarks, shallow: true
  # end

end


# root GET    /                                               users#index
#            user_bookmarks GET    /users/:user_id/bookmarks(.:format)             bookmarks#index
#                           POST   /users/:user_id/bookmarks(.:format)             bookmarks#create
#         new_user_bookmark GET    /users/:user_id/bookmarks/new(.:format)         bookmarks#new
#             edit_bookmark GET    /bookmarks/:id/edit(.:format)                   bookmarks#edit
#                  bookmark GET    /bookmarks/:id(.:format)                        bookmarks#show
#                           PATCH  /bookmarks/:id(.:format)                        bookmarks#update
#                           PUT    /bookmarks/:id(.:format)                        bookmarks#update
#                           DELETE /bookmarks/:id(.:format)                        bookmarks#destroy
#    user_categorybookmarks GET    /users/:user_id/categorybookmarks(.:format)     categorybookmarks#index
#                           POST   /users/:user_id/categorybookmarks(.:format)     categorybookmarks#create
# new_user_categorybookmark GET    /users/:user_id/categorybookmarks/new(.:format) categorybookmarks#new
#     edit_categorybookmark GET    /categorybookmarks/:id/edit(.:format)           categorybookmarks#edit
#          categorybookmark GET    /categorybookmarks/:id(.:format)                categorybookmarks#show
#                           PATCH  /categorybookmarks/:id(.:format)                categorybookmarks#update
#                           PUT    /categorybookmarks/:id(.:format)                categorybookmarks#update
#                           DELETE /categorybookmarks/:id(.:format)                categorybookmarks#destroy
#                     users GET    /users(.:format)                                users#index
#                           POST   /users(.:format)                                users#create
#                  new_user GET    /users/new(.:format)                            users#new
#                 edit_user GET    /users/:id/edit(.:format)                       users#edit
#                      user GET    /users/:id(.:format)                            users#show
#                           PATCH  /users/:id(.:format)                            users#update
#                           PUT    /users/:id(.:format)                            users#update
#                           DELETE /users/:id(.:format)                            users#destroy