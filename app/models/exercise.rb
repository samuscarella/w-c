class Exercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  has_many :tips, dependent: :destroy
  validates :name, :difficulty, :description, :user_id, :workout_id, :equipment, :sets, :reps, presence: true
end
