class Workout < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :targeted_muscles
  has_many :exercises
  validates :title, :description, :difficulty, :duration, :targeted_muscles, :user_id, presence: true
end
