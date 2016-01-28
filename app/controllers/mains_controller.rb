class MainsController < ApplicationController
  before_filter :require_login
  respond_to :html, :js


  def dash
    @workouts = Workout.all
  end

  def createTip
    @exercise = Exercise.find(params[:exercise_id])
    @tip = @exercise.tips.create( new_tip )
    respond_to do |format|
      if @tip.save
         format.html { redirect_to controller: 'mains', action: 'addExercise', tip: @tip }
         format.json {}
      else
         format.html { render action: 'addExercise' }
         format.json { render json: @tip.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def createTipEdit
    @exercise = Exercise.find(params[:exercise_id])
    @tip = @exercise.tips.create( new_tip )
    respond_to do |format|
      if @tip.save
         format.html { redirect_to controller: 'mains', action: 'editWorkout', tip: @tip }
         format.json
      else
         format.html { render action: 'editWorkout' }
         format.json { render json: @tip.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end


  def updateTip
    @tip = Tip.find(params[:tip][:id])
    @workout = Workout.find(params[:tip][:workout_id])
    respond_to do |format|
    if @tip.update_attributes( new_tip )
      format.html { redirect_to controller: 'mains', action: 'editWorkout', id: @workout.id }
      format.json
     else
      format.html { render action: 'editWorkout' }
      format.json { render json: @workout.errors, status: :unprocessable_entity }
     end
    end
  end

  def deleteTip
    @tip = Tip.find(params[:tip_id])
    respond_to do |format|
      if @tip.destroy
         format.html { redirect_to controller: 'mains', action: 'addExercise', id: params[:workout_id] }
         format.json
       else
         format.html { render action: 'addExercise' }
         format.json { render json: @tip.errors.full_messages, status: :unprocessable_entity }
       end
     end
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

  private
  def new_tip
    params.require(:tip).permit(:name, :exercise_id, :user_id)
  end

end
