Rails.application.routes.draw do

	match '(:anything)' => 'application#nothing', via: [:options]

	root 'static_pages#home'

	get '/:key', to: 'application#goToOuterUrl'

	get 'ltr/*path', to: 'static_pages#home'

	post '/register',  to: 'users#create'

	post   '/login',   to: 'sessions#create'

  	delete '/logout',  to: 'sessions#destroy'

  	post '/myurls', to: 'shortenurls#show'

  	post '/myurls/create', to: 'shortenurls#create'

	resources :users
	resources :shortenurls
end
