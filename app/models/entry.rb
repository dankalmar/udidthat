class Entry < ActiveRecord::Base
  attr_accessible :did
  validates :did, presence: true

  scope :for_date, lambda { |date| where(created_at: date.beginning_of_day..date.end_of_day) }

  belongs_to :user


end
