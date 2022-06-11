Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
root to: 'tests#index'

# Создайте ресурс Вопросов, вложенный в ресурс Тестов
resources :tests do
  resources :questions, shallow: true
end

# resources :questions
get '/questions', to: 'questions#index' # Просмотра списка вопросов теста
get '/questions/:id', to: 'questions#show' # Просмотра конкретного вопроса теста
post '/questions/:id', to: 'questions#create' # Создания вопроса
delete '/questions/:id', to: 'questions#destroy' # Удаления вопроса

get '/tests/:category/:title', to: 'tests#search', level: 2

end
