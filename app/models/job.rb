class Job < ActiveRecord::Base
  validates :name, :url, :location, presence: true

  attr_accessible :name, :url, :location, :location_id, as: :admin

  default_scope -> { where(:label => Whitelabel[:label_id]) }

  scope :shuffled, -> { all.shuffle }

  belongs_to :location
end
