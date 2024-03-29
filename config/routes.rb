Rails.application.routes.draw do
  resources :doctortimeslots, only:[:create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "/admin/doctors/approve_reject/:id" => 'admin/doctors#approve_reject',as:  "admin_doctor_approve_reject"
  get "/admin/appoinments/approve_reject/:id" => 'admin/appoinments#approve_reject',as:  "admin_appoinment_approve_reject"
  devise_for :patients, controllers: { registrations: 'patients/registrations' }
	root :to => "staticpage#new"
  devise_for :doctors, controllers: { registrations: 'doctors/registrations', sessions: 'doctors/sessions' }
  #get 'doctors/show/:id' => "doctors#show"
  resources :doctors, only: [:show, :index]
  resources :patients, only: [:show]
  #get 'patients/show'
  resources :appoinments, only:[:new, :create, :update]
  get 'appoinments/slot_show'
  get 'appoinments/patient_appoinment'
  get 'appoinments/doctor_appoinment_application_list'
  get 'appoinments/doctor_appoinment'
  get 'notifications/doctor_notification'
  get 'notifications/patient_notification'
  #get 'appoinments/new/:id' => 'appoinments#new'
  #root to: 'sessions#new'
  #root :to => "/doctors/sign_in" => 'devise/sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
