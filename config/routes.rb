Rails.application.routes.draw do
  devise_for :patients
	root :to => "staticpage#new"
	get "staticpage/hello"
	get "staticpage/bye"
  devise_for :doctors
  #root to: 'sessions#new'
  #root :to => "/doctors/sign_in" => 'devise/sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
