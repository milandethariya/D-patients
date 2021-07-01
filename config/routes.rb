Rails.application.routes.draw do
  resources :doctortimeslots, only:[:create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :patients, controllers: { registrations: 'patients/registrations' }
	root :to => "staticpage#new"
	get "staticpage/hello"
	get "staticpage/bye"
  devise_for :doctors, controllers: { registrations: 'doctors/registrations', sessions: 'doctors/sessions' }
  #get 'doctors/show/:id' => "doctors#show"
  resources :doctors, only: [:show, :index]
  resources :patients, only: [:show]
  #get 'patients/show'
  resources :appoinments, only:[:new, :create, :update]
  get 'appoinments/patient_appoinment'
  get 'appoinments/doctor_appoinment_application_list'
  get 'appoinments/doctor_appoinment'
  #get 'appoinments/new/:id' => 'appoinments#new'
  #root to: 'sessions#new'
  #root :to => "/doctors/sign_in" => 'devise/sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
