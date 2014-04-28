class Color < ActiveRecord::Base
  validates :name, :primary, :spectrum, :presence => true
end