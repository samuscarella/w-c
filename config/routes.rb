Rails.application.routes.draw do

  root 'sessions#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  post 'register' => 'sessions#register'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout'
  get 'dash' => 'mains#dash'
  get 'new_workout' => 'mains#newWorkout'
  post 'create_workout' => 'mains#createWorkout'
  get 'workout/:id/newExercise' => 'mains#addExercise'
  post 'workout/:id/create_exercise' => 'mains#createExercise'
  post 'edit_workout/create_exercise' => 'mains#createExercise'
  post 'workout/:id/exercise/:exercise_id/create_tip' => 'mains#createTip'
  post 'edit_workout/exercise/:exercise_id/create_tip' => 'mains#createTipEdit'
  delete 'exercise' => 'mains#deleteExercise'
  delete 'delete_exercise' => 'mains#deleteExercise'
  delete 'delete_tip' => 'mains#deleteTip'
  delete 'delete_workout' => 'mains#deleteWorkout'
  delete 'workout.:id' => 'mains#deleteWorkout'
  delete 'edit_workout/delete_exercise' => 'mains#deleteExercise'
  get 'workout/:id/show_workout' => 'mains#showWorkout'
  patch 'edit_workout/exercise/update_tip' => 'mains#updateTip'
  put 'edit_workout/update_workout' => 'mains#updateWorkout'
  patch 'edit_workout/update_exercise' => 'mains#updateExercise'
  get 'edit_workout/:id' => 'mains#editWorkout'
  get 'workout/:id' => 'mains#showWorkout'
  get 'workout' => 'mains#showWorkout'
  post 'exercise/:id/create_tip' => 'mains#createTip'
  get 'workouts' => 'mains#myWorkouts'

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
