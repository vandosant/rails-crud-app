class Wine < ActiveRecord::Base
  validates :name, :style, :presence => true
  validates :rating, :inclusion => {:in => 0..100}
end