Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :patients, controllers: { registrations: 'patients/registrations' }
	root :to => "staticpage#new"
	get "staticpage/hello"
	get "staticpage/bye"
  devise_for :doctors, controllers: { registrations: 'doctors/registrations', sessions: 'doctors/sessions' }
  get 'doctors/show'
  get 'patients/show'
  #root to: 'sessions#new'
  #root :to => "/doctors/sign_in" => 'devise/sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
