Rails.application.routes.draw do



# Should the bookmark resources be under category_bookmarks? 
# In the bookmarks id there are no user_id - Insure user has to be logged in

  resources :user do 
    resources :bookmarks, shallow: true
    resources :category_bookmarks, shallow: true
  end

end

#    user_bookmarks GET    /user/:user_id/bookmarks(.:format)              bookmarks#index
#                            POST   /user/:user_id/bookmarks(.:format)              bookmarks#create
#          new_user_bookmark GET    /user/:user_id/bookmarks/new(.:format)          bookmarks#new
#              edit_bookmark GET    /bookmarks/:id/edit(.:format)                   bookmarks#edit
#                   bookmark GET    /bookmarks/:id(.:format)                        bookmarks#show
#                            PATCH  /bookmarks/:id(.:format)                        bookmarks#update
#                            PUT    /bookmarks/:id(.:format)                        bookmarks#update
#                            DELETE /bookmarks/:id(.:format)                        bookmarks#destroy
#    user_category_bookmarks GET    /user/:user_id/category_bookmarks(.:format)     category_bookmarks#index
#                            POST   /user/:user_id/category_bookmarks(.:format)     category_bookmarks#create
# new_user_category_bookmark GET    /user/:user_id/category_bookmarks/new(.:format) category_bookmarks#new
#     edit_category_bookmark GET    /category_bookmarks/:id/edit(.:format)          category_bookmarks#edit
#          category_bookmark GET    /category_bookmarks/:id(.:format)               category_bookmarks#show
#                            PATCH  /category_bookmarks/:id(.:format)               category_bookmarks#update
#                            PUT    /category_bookmarks/:id(.:format)               category_bookmarks#update
#                            DELETE /category_bookmarks/:id(.:format)               category_bookmarks#destroy
#                 user_index GET    /user(.:format)                                 user#index
#                            POST   /user(.:format)                                 user#create
#                   new_user GET    /user/new(.:format)                             user#new
#                  edit_user GET    /user/:id/edit(.:format)                        user#edit
#                       user GET    /user/:id(.:format)                             user#show
#                            PATCH  /user/:id(.:format)                             user#update
#                            PUT    /user/:id(.:format)                             user#update
#                            DELETE /user/:id(.:format)                             user#destroy



