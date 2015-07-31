Rails.application.routes.draw do

	root 'bookmarks#index'

	get '/login', to: "sessions#login", as: 'login'
	get '/signup', to: "sessions#signup", as: 'signup'
	post '/login', to: "sessions#attempt_login"
	post '/signup', to: "sessions#create"
	# get '/home', to: "sessions#index", as: 'home'
	delete '/logout', to: "sessions#logout", as: "logout"


	root 'searches#index'
	# root 'sessions#index'


 # get 'searches/index', to: 'searches#index', as: 'searches'
 # post 'searches/index', to: 'searches#new', as: 'new_search'


 # Do booksmarks need to go under the createBookmark routes?
 # double check that create update destroy uses the user_id
 # root "sessions#index"





 get '/users/:id/new_visit', to: 'sessions#new_visit'
 get '/users/:id/bookmarks/new_from_extension', to: 'bookmarks#create_from_extension'

  

 	# get '/users/:user_id/searches', to: 'searches#index', as: 'user_searches'

  resources :searches



  resources :users do
 # Do booksmarks need to go under the createBookmark routes?
 # double check that create update destroy uses the user_id
 	
    resources :bookmarks, shallow: true
    resources :category_bookmarks, shallow: true
  end

  get '/users/:id/new_visit', to: 'sessions#new_visit'
 get '/users/:id/bookmarks/new_from_extension', to: 'bookmarks#create_from_extension'

end


#                      login GET    /login(.:format)                                  sessions#login
#                     signup GET    /signup(.:format)                                 sessions#signup
#                            POST   /login(.:format)                                  sessions#attempt_login
#                            POST   /signup(.:format)                                 sessions#create
#                     logout DELETE /logout(.:format)                                 sessions#logout
#                       root GET    /                                                 searches#index
#                            GET    /users/:id/new_visit(.:format)                    sessions#new_visit
#                            GET    /users/:id/bookmarks/new_from_extension(.:format) bookmarks#create_from_extension
#                   searches GET    /searches(.:format)                               searches#index
#                            POST   /searches(.:format)                               searches#create
#                 new_search GET    /searches/new(.:format)                           searches#new
#                edit_search GET    /searches/:id/edit(.:format)                      searches#edit
#                     search GET    /searches/:id(.:format)                           searches#show
#                            PATCH  /searches/:id(.:format)                           searches#update
#                            PUT    /searches/:id(.:format)                           searches#update
#                            DELETE /searches/:id(.:format)                           searches#destroy
#             user_bookmarks GET    /users/:user_id/bookmarks(.:format)               bookmarks#index
#                            POST   /users/:user_id/bookmarks(.:format)               bookmarks#create
#          new_user_bookmark GET    /users/:user_id/bookmarks/new(.:format)           bookmarks#new
#              edit_bookmark GET    /bookmarks/:id/edit(.:format)                     bookmarks#edit
#                   bookmark GET    /bookmarks/:id(.:format)                          bookmarks#show
#                            PATCH  /bookmarks/:id(.:format)                          bookmarks#update
#                            PUT    /bookmarks/:id(.:format)                          bookmarks#update
#                            DELETE /bookmarks/:id(.:format)                          bookmarks#destroy
#    user_category_bookmarks GET    /users/:user_id/category_bookmarks(.:format)      category_bookmarks#index
#                            POST   /users/:user_id/category_bookmarks(.:format)      category_bookmarks#create
# new_user_category_bookmark GET    /users/:user_id/category_bookmarks/new(.:format)  category_bookmarks#new
#     edit_category_bookmark GET    /category_bookmarks/:id/edit(.:format)            category_bookmarks#edit
#          category_bookmark GET    /category_bookmarks/:id(.:format)                 category_bookmarks#show
#                            PATCH  /category_bookmarks/:id(.:format)                 category_bookmarks#update
#                            PUT    /category_bookmarks/:id(.:format)                 category_bookmarks#update
#                            DELETE /category_bookmarks/:id(.:format)                 category_bookmarks#destroy
#                      users GET    /users(.:format)                                  users#index
#                            POST   /users(.:format)                                  users#create
#                   new_user GET    /users/new(.:format)                              users#new
#                  edit_user GET    /users/:id/edit(.:format)                         users#edit
#                       user GET    /users/:id(.:format)                              users#show
#                            PATCH  /users/:id(.:format)                              users#update
#                            PUT    /users/:id(.:format)                              users#update
#                            DELETE /users/:id(.:format)                              users#destroy