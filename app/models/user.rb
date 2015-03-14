class User < ActiveRecord::Base
  has_many :friends
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.image = auth["info"]["image"]
      user.gender = auth["extra"]["raw_info"]["gender"]
      user.age = auth["extra"]["raw_info"]["age_range"]["min"]

      user.token = auth["credentials"]["token"]
    end
  end
end