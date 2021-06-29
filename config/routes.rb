Rails.application.routes.draw do
  devise_for :patients, controllers: { registrations: 'patients/registrations' }
	root :to => "staticpage#new"
	get "staticpage/hello"
	get "staticpage/bye"
  devise_for :doctors, controllers: { registrations: 'doctors/registrations' }
  #root to: 'sessions#new'
  #root :to => "/doctors/sign_in" => 'devise/sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
