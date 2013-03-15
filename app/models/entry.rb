class Entry < ActiveRecord::Base
  attr_accessible :did

  belongs_to :user
end
