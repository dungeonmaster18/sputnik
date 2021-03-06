Rails.application.routes.draw do
  get 'history/index'
  root 'users#home'
  get 'signup', to: 'users#signup', as: 'signup'
  get 'login', to: 'sessions#login', as: 'login'
  get 'logout', to: 'sessions#logout', as: 'logout'
  get 'users/verify/:token', to: 'users#verify'
  get 'user_profile/:id/basic_details', to: 'user_profile#basic_details', as: 'basic_details'
  patch 'user_profile/:id/basic_details', to:'user_profile#basic_details_submit', as: 'basic_details_edit'
  post 'user_profile/:id/basic_details', to:'user_profile#basic_details_submit', as: 'basic_details_submit'
  get 'user_profile/:id/driving_license', to: 'user_profile#driving_license', as: 'driving_license'
  patch 'user_profile/:id/driving_license', to:'user_profile#driving_license_submit', as: 'driving_license_edit'
  post 'user_profile/:id/driving_license', to:'user_profile#driving_license_submit', as: 'driving_license_submit'
  get 'user_profile/:id/vehicle_registration_card', to: 'user_profile#vehicle_registration_card', as: 'vehicle_registration_card'
  patch 'user_profile/:id/vehicle_registration_card', to:'user_profile#vehicle_registration_card_submit', as: 'vehicle_registration_card_edit'
  post 'user_profile/:id/vehicle_registration_card', to:'user_profile#vehicle_registration_card_submit', as: 'vehicle_registration_card_submit'
  post 'user_profile/:id/apply', to:'user_profile#apply', as: 'apply'
  patch 'user_profile/:id/apply', to:'user_profile#apply', as: 'apply_edit'
  get 'user_profile/:id/application_preview', to:'user_profile#application_preview', as: 'application_preview'
  post 'submission/update_status/:application_id/:id', to:'submission#update_status', as: 'update_status'

  get '/history/:id/index', to:'history#index', as: 'history_preview'
  #get '/history/:id/index/view_history', to:'history#index', as: 'history_preview_1'

  get 'admin/:id/home', to: 'admin#home', as: 'admin_home'
  get 'admin_login', to: 'admin_session#login', as: 'admin_login'
  get 'admin/:id/review_application/:application_id', to: 'admin#review_application', as: 'review_application'

  resources :users, :sessions, :user_profile, :admin_session, :admin, :history
end
