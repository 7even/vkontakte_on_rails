VkontakteOnRails::Application.routes.draw do
  get 'login'     => 'sessions#new'
  get 'callback'  => 'sessions#callback'
  delete 'logout' => 'sessions#destroy'
  
  root to: 'main#index'
end
