module ApplicationHelper
  def login_path
    query = request.query_parameters.to_query
    "/auth/facebook?#{query}"
  end
end
