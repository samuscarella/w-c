class ExercisesController < ApplicationController
  before_filter :require_login
  respond_to :html, :js

  def addExercise
    @user = User.find(session[:current_user_id])
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
    @exercise = Exercise.new
    # respond_with(@exercises)
    # dont know if i need the includes tips part at the end above
  end

  def createExercise
    @exercise = Exercise.new( new_exercise )
    respond_to do |format|
      if @exercise.save
         format.html { redirect_to controller: 'mains', action: 'addExercise', id: params[:workout_id]  }
         format.js
       else
         format.html { render action: 'addExercise' }
         format.json { render json: @exercise.errors.full_messages, status: :unprocessable_entity }
       end
     end
  end

  def updateExercise
    @exercise = Exercise.find(params[:exercise][:id])
    @workout = Workout.find(params[:exercise][:workout_id])
    respond_to do |format|
    if @exercise.update_attributes( new_exercise )
      format.html { redirect_to controller: 'mains', action: 'editWorkout', id: @workout.id }
      format.json
     else
      format.html { render action: 'editWorkout' }
      format.json { render json: @workout.errors, status: :unprocessable_entity }
     end
    end
  end

  def deleteExercise
    @exercise = Exercise.find(params[:id])
    respond_to do |format|
      if @exercise.destroy
        format.html { redirect_to controller: 'mains', action: 'editWorkout', id: params[:workout_id] }
        format.json { head :no_content }
        format.js   { render :layout => false }
       else
         format.html { render action: 'addExercise' }
         format.json { render json: @tip.errors.full_messages, status: :unprocessable_entity }
       end
     end
  end

  private
  def new_exercise
    params.require(:exercise).permit(:name, :difficulty, :user_id, :description, :equipment, :sets, :reps, :workout_id)
  end
end
