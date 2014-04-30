class Color < ActiveRecord::Base
  validates :name, :presence => {:message => "A color is required"}
  validates :spectrum, :presence => {:message => "A spectrum is required"}
end