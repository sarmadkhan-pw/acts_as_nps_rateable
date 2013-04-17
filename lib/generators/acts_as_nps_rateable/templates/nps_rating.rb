class NpsRating < ActiveRecord::Base
  belongs_to :nps_rateable, polymorphic: true
  belongs_to :user

  validates :score, presence: true, numericality: { only_integer: true }, inclusion: { in: (0..10).to_a, message: "must be between 0 and 10" }
  validates :nps_rateable_id, :nps_rateable_type, presence: true
  validates :user_id, presence: true, uniqueness: { scope: [:nps_rateable_type, :nps_rateable_id], message: "has already rated" }
end