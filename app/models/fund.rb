class Fund < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift
  belongs_to :friend
end