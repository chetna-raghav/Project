Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  "users#home"
  get "/users/about", to: "users#about"
  get "/users/usersignup", to: "users#new"
  post "/users/usersignup", to: "users#create"
  get "/users/userlogin", to: "users#usernew"
  post "/users/userlogin", to: "users#usercreate"
  get "/busowners/busownersignup", to: "busowners#new"
  post "/busowners/busownersignup", to: "busowners#create"
  get "/busowners/busownerlogin", to: "busowners#loginnew"
  post "/busowners/busownerlogin", to: "busowners#logincreate"
  get "/booking/:user_id/:businfo_id/", to: "users#booking", as: "booking"
  get "/confirmbooking/:user_id/:businfo_id", to: "businfo_user#create", as: "confirmbooking"
  get "/cancelbooking/:user_id/:id/:businfo_id/", to: "users#destroy", as: "cancelbooking"
  post "/busowners/:busowner_id/businfos/:id", to: "businfos#update", as: "editbusinfo"
  post "/users/:id/searchbus", to: "users#searchbus", as: "searchbus"
  get "/users/:id/searchbus", to: "users#show"
  get "/users/:id/bookinghistory", to: "users#bookinghistory", as: "bookinghistory"
  delete "userlogout", to:"users#destroyusersession"
  delete "ownerlogout", to:"busowners#destroyownersession"
  resources :users
  resources :busowners do
    resources :businfos
  end  
end
