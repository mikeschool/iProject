Rails.application.routes.draw do
  

  get 'rss/index'
  get 'json' => 'rss#show'

  get 'trouw' => 'rss#trouw'
  get 'volkskrant' => 'rss#volkskrant'
  get 'ad' => 'rss#ad'
  
  root 'rss#index'
end
