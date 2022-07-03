Rails.application.routes.draw do
  get "/twilio", to: "users#send_text"
  post "social_auth/callback", to: "social_auth_controller#authenticate_social_auth_user" # this is the line where we add our routes

  # Users
  post "/users", to: "users#create"
  get "/users", to: "users#index"
  get "/employee", to: "users#employee"
  get "/customer", to: "users#customer"
  get "/customer/:id", to: "users#customer_profile"
  get "/employee/:id", to: "users#employee_profile"
  get "/customer_country/:id", to: "users#customer_country"
  delete "/users/:id", to: "users#destroy"
  patch "/user_update/:id", to: "users#update_user"
  get "/user_id/:id", to: "users#customer_profile_user"

  # admin
  patch "/admin/:id", to: "users#create_admin"
  get "/admin/:id", to: "users#admin_profile"
  get "/admin", to: "users#admin"

  # Employee
  patch "/employees/:id", to: "users#create_employee"
  patch "/customers/:id", to: "users#create_customer"
  delete "/employee/:id", to: "users#destroy_employee"

  resource :profile, controller: :users
  # Sessions
  post "/login_social", to: "sessions#login_social"
  post "/login_phone", to: "sessions#login_phone"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/verify", to: "users#verify"

  get "/offices", to: "offices#index"
  post "/offices", to: "offices#create"

  # Categories
  get "/categories", to: "categories#index"
  get "/categories/:id", to: "categories#show", as: "category"
  post "/categories", to: "categories#create"
  delete "/categories/:id", to: "categories#destroy"
  patch "/categories/:id", to: "categories#update"
  get "/show_country/:id", to: "categories#show_country"

  # Notifications
  get "/notifications", to: "notifications#index_all"
  get "/notify/:id", to: "notifications#show_all"
  post "/notifications", to: "notifications#create_all"
  delete "/notifications/:id", to: "notifications#destroy_all"

  # Report
  get "/reports", to: "reports#index_all"
  get "/reports/:id", to: "reports#show_all"
  post "/reports", to: "reports#create_all"
  delete "/reports/:id", to: "reports#destroy_all"

  # Services
  get "/services", to: "services#index"
  get "/services/:id", to: "services#show"
  get "/service/:id", to: "services#show_service"
  post "/services", to: "services#create"
  delete "/services/:id", to: "services#destroy"
  patch "/services/:id", to: "services#update"

  # EmployeeCategories
  get "/employee_categories", to: "employee_categories#index"
  get "/employee_categories/:id", to: "employee_categories#show"
  post "/employee_categories", to: "employee_categories#create"
  get "/employee_cat/:id", to: "employee_categories#show_employee_category"
  delete "/employee_categories/:id", to: "employee_categories#destroy"

  get "/employee_category/:id", to: "employee_categories#show_employee"
  # OrderDetails
  get "/order_details", to: "order_details#latest"
  get "/orders", to: "order_details#index"

  get "/order_details/:id", to: "order_details#show"
  get "/order_customer/:id", to: "order_details#show_customer"
  get "/order_employee/:id", to: "order_details#show_employee"

  post "/order_details", to: "order_details#create"
  patch "/order_details/:id", to: "order_details#update"
  delete "/order_details/:id", to: "order_details#destroy"
  get "/order/:id", to: "order_details#show_order"

  # Reviews
  get "/reviews", to: "reviews#index"
  get "/reviews/:id", to: "reviews#show"
  post "/reviews", to: "reviews#create"

  # Employee Hability
  get "/hability_employees", to: "hability_employees#index"
  get "/hability_employees/:id", to: "hability_employees#show"
  get "/he/:id", to: "hability_employees#show_he"
  post "/hability_employees", to: "hability_employees#create"
  patch "/hability_employees/:id", to: "hability_employees#update"
  delete "/hability_employees/:id", to: "hability_employees#destroy"

  # Hability
  get "/hability", to: "habilities#index"
  get "/hability/:id", to: "habilities#show"
  post "/hability", to: "habilities#create"
  patch "/hability/:id", to: "habilities#update"
  delete "/hability/:id", to: "habilities#destroy"

  # Cupons
  get "/cupons", to: "cupons#index"
  get "/cupons/:id", to: "cupons#show"
  get "/cupon/:id", to: "cupons#cupon"
  post "/cupons", to: "cupons#create"
  patch "/cupons/:id", to: "cupons#update"
  delete "/cupons/:id", to: "cupons#destroy"

  # Customers Cupons
  get "/cupon_users", to: "cupon_users#index"
  get "/cupon_users/:id", to: "cupon_users#show"
  post "/cupon_users", to: "cupon_users#create"
  patch "/cupon_users", to: "cupon_users#update"
  get "/show_cupon/:id", to: "cupons#show_cupon"
  delete "/delete_cupon_users/:id", to: "cupon_users#destroy"

  # Addres
  get "/address", to: "addresses#index"
  get "/address/:id", to: "addresses#show"
  post "/address", to: "addresses#create"
  patch "/address", to: "addresses#update"

  # Newslatter
  post "/newslatters", to: "newslatters#create"
  get "/newslatters/:id", to: "newslatters#show"
  get "/newslatters", to: "newslatters#index"
  delete "/newslatters/:id", to: "newslatters#destroy"
  patch "/newslatters/:id", to: "newslatters#update"

  # Sectores
  post "/sector", to: "sector#create"
  get "/sector/:id", to: "sector#show"
  get "/sector", to: "sector#index"
  delete "/sector/:id", to: "sector#destroy"
  patch "/sector/:id", to: "sector#update"

  # Sectores
  post "/sector_cats", to: "sector_cats#create"
  get "/sector_cats/:id", to: "sector_cats#show"
  get "/sector_cats", to: "sector_cats#index"
  delete "/sector_cats/:id", to: "sector_cats#destroy"
  patch "/sector_cats/:id", to: "sector_cats#update"

  # Favoites
  get "/favorites", to: "favorites#index"
  post "/favorites", to: "favorites#create"
  get "/favorites/:id", to: "favorites#show"

  resources :categories
  get "/latest", to: "categories#latest"

  namespace :api do
    # Locally and Authyly user creation
    post "/user/register", to: "users#register"
    get "/user/users", to: "users#index"

    # Authentication API
    post "/login", to: "authentication#login"
    match "/logout", to: "authentication#logout", via: %i[get post]
    post "/loggedIn", to: "authentication#loggedIn"

    # Account Security Authentication API
    post "/accountsecurity/sms", to: "twofa#sms"
    post "/accountsecurity/voice", to: "twofa#voice"
    post "/accountsecurity/verify", to: "twofa#verify"
    post "/accountsecurity/onetouchstatus", to: "twofa#onetouchstatus"
    post "/accountsecurity/onetouch", to: "twofa#onetouch"

    # Account Security Phone Verification API
    post "/verification/start", to: "verify#start"
    post "/verification/verify", to: "verify#verify"
    post "/create_service", to: "verify#create_services"
    post "/edit_service", to: "verify#edit_services"
    post "/cancel_services", to: "verify#cancel_services"

  end
end
