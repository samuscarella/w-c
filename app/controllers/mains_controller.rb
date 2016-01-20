class MainsController < ApplicationController

  before_filter :require_login

  def index
  end

  def dash
    @workouts = Workout.all
  end

  def myWorkouts
  end

  def newWorkout
    @workout = Workout.new
  end

  def showWorkout
    @workout = Workout.find(params[:id])
  end

  def myWorkouts
    @workouts = User.find(session[:current_user_id]).workouts
  end
  def editWorkout
    @workout = Workout.find(params[:id])
  end

  def addExercise
    @user = User.find(session[:current_user_id])
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
    # dont know if i need the includes tips part at the end above
  end

  def createWorkout
    w = Workout.create( new_workout )
    if w.errors.any?
      flash[:workoutErrors] = w.errors.full_messages
      redirect_to '/new_workout'
    else
      redirect_to controller: 'mains', action: 'addExercise', id: w.id
    end
  end

  def createTip
    @exercise = Exercise.find(params[:exercise_id])
    @tip = @exercise.tips.create( new_tip )
    respond_to do |format|
      if @tip.save
         format.html { redirect_to controller: 'mains', action: 'addExercise', tip: @tip }
         format.json
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

  def createExercise
    @exercise = Exercise.new( new_exercise )
    respond_to do |format|
      if @exercise.save
         format.html { redirect_to controller: 'mains', action: 'addExercise', id: @exercise, workout_id: params[:workout_id]  }
         format.json
       else
         format.html { render action: 'addExercise' }
         format.json { render json: @exercise.errors.full_messages, status: :unprocessable_entity }
       end
     end
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

  def deleteExercise
    @exercise = Exercise.find(params[:exercise_id])
    respond_to do |format|
      if @exercise.destroy
         format.html { redirect_to controller: 'mains', action: 'addExercise', id: params[:workout_id] }
         format.json
       else
         format.html { render action: 'addExercise' }
         format.json { render json: @tip.errors.full_messages, status: :unprocessable_entity }
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

  # PRIVATE METHODS FOR IMPROVED SECURITY

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
