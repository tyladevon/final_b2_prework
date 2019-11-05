Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :students, only:[:show]

resources :courses, only:[:show]

delete "/course_students/:id", to: "course_students#destroy"

post "/course_students", to: "course_students#create"

end
