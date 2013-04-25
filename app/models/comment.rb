class Comment < ActiveRecord::Base
  attr_accessible :date_trip, :feelings, :people, :place, :transport
  belongs_to :traveler, :foreign_key => "user_id"
  
  validates :user_id, presence: true
  validates :date_trip, presence: true
  validates :place, presence: true
  validates :people, presence: true
  validates :transport, presence: true
  validates :feelings, presence: true, length: { maximum: 200 }
  
  default_scope order: 'comments.created_at DESC'
end
