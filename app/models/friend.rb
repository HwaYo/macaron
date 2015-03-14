class Friend < ActiveRecord::Base
  belongs_to :user , dependent: :destroy
  has_many :funds
  validates :uid , uniqueness: true

  def profile_image
    "http://graph.facebook.com/#{self.uid}/picture"
  end
end
