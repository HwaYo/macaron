Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1562660880653325', 'e1f18062ea1935ad0b6877594993fc1e', { info_fields: "birthday,age_range"}
end