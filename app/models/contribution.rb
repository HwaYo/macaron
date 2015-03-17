class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :fund

  scope :approved, -> { where(approved: true) }

  def approve!
    update_attributes!(approved: true)
  end
end
