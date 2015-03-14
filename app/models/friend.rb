class Friend < ActiveRecord::Base
  belongs_to :user , dependent: :destroy
  has_many :funds
  validates :uid , uniqueness: true
end
