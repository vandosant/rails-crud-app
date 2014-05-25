class Car < ActiveRecord::Base
  validates :make, :model, :year, presence: { if: :required?, message: 'is required.' }

  private

  def required?
    true
  end
end