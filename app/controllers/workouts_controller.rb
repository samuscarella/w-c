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
    @exercises = @workout.exercises
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
      format.html { redirect_to controller: 'workouts', action: 'editWorkout', id: @workout.id }
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

  # exercise methods

  def createExercise
    @exercise = Exercise.new( new_exercise )
    respond_to do |format|
      if @exercise.save
        @exercises = @exercise.workout.exercises
        format.js
       else
         format.html { render action: 'editWorkout', id: params[:id] }
         format.json { render json: @exercise.errors.full_messages, status: :unprocessable_entity }
       end
     end
  end

  def updateExercise
    @exercise = Exercise.find(params[:exercise][:id])
    @workout = Workout.find(params[:exercise][:workout_id])
    respond_to do |format|
    if @exercise.update_attributes( new_exercise )
      format.html { redirect_to controller: 'workouts', action: 'editWorkout', id: @workout.id }
      format.json
     else
      format.html { render action: 'editWorkout' }
      format.json { render json: @workout.errors, status: :unprocessable_entity }
     end
    end
  end

  # private object methods for improved security

  private
  def new_workout
    params.require(:workout).permit(:title, :description, :difficulty, :duration, :user_id, targeted_muscle_ids:[])
  end
  private
  def new_exercise
    params.require(:exercise).permit(:name, :difficulty, :user_id, :description, :equipment, :sets, :reps, :workout_id)
  end

end
