Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
root 'tests#index'

# Создайте ресурс Вопросов, вложенный в ресурс Тестов
resources :tests do
  resources :questions, shallow: true
end

get '/tests/:category/:title', to: 'tests#search', level: 2
get '/questions/:id/destroy', to: 'questions#destroy'
end
