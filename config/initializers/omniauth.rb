Rails.application.config.middleware.use OmniAuth::Builder do
  option = {
    scope: "user_birthday,email,public_profile,user_friends",
    info_fields: "first_name,last_name,name,email,age_range,gender"
  }

  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], option
end