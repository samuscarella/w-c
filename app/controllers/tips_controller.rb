class TipsController < ApplicationController
  before_filter :require_login
  respond_to :html, :js

  def createTip
    @exercise = Exercise.find(params[:exercise_id])
    @tip = @exercise.tips.create( new_tip )
    respond_to do |format|
      if @tip.save
        @tips = @tip.exercise.tips
        format.js
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
    @tip = Tip.find(params[:id])
    respond_to do |format|
      if @tip.destroy
        format.js
       else
         format.html { render action: 'addExercise' }
         format.json { render json: @tip.errors.full_messages, status: :unprocessable_entity }
       end
     end
  end

  private
  def new_tip
    params.require(:tip).permit(:name, :exercise_id, :user_id)
  end

end
