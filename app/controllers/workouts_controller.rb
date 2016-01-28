class WorkoutsController < ApplicationController
  before_filter :require_login
  respond_to :html, :js
  # navigation methods

  def newWorkout
    @workout = Workout.new
  end
  def myWorkouts
    @workouts = User.find(session[:current_user_id]).workouts
  end
  def editWorkout
    @workout = Workout.find(params[:id])
  end

  # crud operations

  def createWorkout
    w = Workout.create( new_workout )
    if w.errors.any?
      flash[:workoutErrors] = w.errors.full_messages
      redirect_to '/new_workout'
    else
      redirect_to controller: 'exercises', action: 'addExercise', id: w.id
    end
  end

  def showWorkout
    @workout = Workout.find(params[:id])
  end

  def updateWorkout
    @workout = Workout.find(params[:workout][:workout_id])
    respond_to do |format|
    if @workout.update_attributes( new_workout )
      format.html { redirect_to controller: 'mains', action: 'editWorkout', id: @workout.id }
      format.json
     else
      format.html { render action: 'editWorkout' }
      format.json { render json: @workout.errors, status: :unprocessable_entity }
     end
    end
  end

  def deleteWorkout
    @workout = Workout.find(params[:id])
    respond_to do |format|
      if @workout.destroy
         format.html { redirect_to controller: 'mains', action: 'dash' }
         format.json
       else
         format.html { render action: 'editWorkout' }
         format.json { render json: @workout.errors.full_messages, status: :unprocessable_entity }
       end
     end
  end

  # private methods for improved security

  private
  def new_workout
    params.require(:workout).permit(:title, :description, :difficulty, :duration, :user_id, targeted_muscle_ids:[])
  end
end
