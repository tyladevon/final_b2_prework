Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :students, only:[:show]

resources :courses, only:[:show]

delete "/courses/:course_id/students/:student_id", to: "course_students#destroy"

post "/course_students/:course_id", to: "course_students#create"

end
