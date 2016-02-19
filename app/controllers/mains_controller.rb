class MainsController < ApplicationController
  before_filter :require_login
  respond_to :html, :js


  def dash
    @workouts = Workout.all
  end


  # private methods for improved security

  private
  def workout_update_params
    params.permit(:title, :description, :difficulty, :duration, :user_id, targeted_muscle_ids:[])
  end

  private
  def new_workout
    params.require(:workout).permit(:title, :description, :difficulty, :duration, :user_id, targeted_muscle_ids:[])
  end

  private
  def new_exercise
    params.require(:exercise).permit(:name, :difficulty, :user_id, :description, :equipment, :sets, :reps, :workout_id)
  end



end
