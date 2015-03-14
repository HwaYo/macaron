Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1562660880653325', 'e1f18062ea1935ad0b6877594993fc1e', {scope: "user_birthday,email,public_profile,user_friends", info_fields: "first_name,last_name,name,email,age_range,gender"}
end