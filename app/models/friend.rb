class Friend < ActiveRecord::Base
  belongs_to :user , dependent: :destroy
  validates :uid , uniqueness: true
end
