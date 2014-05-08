class Wine < ActiveRecord::Base
  validates :name, :style, :presence => true
end