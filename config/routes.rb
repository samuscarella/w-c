Rails.application.routes.draw do

  root 'sessions#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  post 'register' => 'sessions#register'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout'
  get 'dash' => 'mains#dash'
  get 'new_workout' => 'workouts#newWorkout'
  post 'create_workout' => 'workouts#createWorkout'
  get 'workout/:id/newExercise' => 'exercises#addExercise'
  post 'workout/:id/create_exercise' => 'exercises#createExercise'
  post 'edit_workout/create_exercise' => 'workouts#createExercise'
  post 'workout/:id/exercise/:exercise_id/create_tip' => 'tips#createTip'
  post 'edit_workout/exercise/:exercise_id/create_tip' => 'tips#createTipEdit'
  delete 'exercise' => 'exercises#deleteExercise'
  delete 'delete_exercise' => 'exercises#deleteExercise'
  delete 'delete_tip' => 'tips#deleteTip'
  delete 'delete_workout' => 'workouts#deleteWorkout'
  delete 'workout.:id' => 'workouts#deleteWorkout'
  delete 'edit_workout/delete_exercise' => 'exercises#deleteExercise'
  get 'workout/:id/show_workout' => 'workouts#showWorkout'
  patch 'edit_workout/exercise/update_tip' => 'tips#updateTip'
  put 'edit_workout/update_workout' => 'workouts#updateWorkout'
  patch 'edit_workout/update_exercise' => 'workouts#updateExercise'
  get 'edit_workout/:id' => 'workouts#editWorkout'
  get 'workout/:id' => 'workouts#showWorkout'
  get 'workout' => 'workouts#showWorkout'
  post 'exercise/:id/create_tip' => 'tips#createTip'
  get 'workouts' => 'workouts#myWorkouts'

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  # get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
