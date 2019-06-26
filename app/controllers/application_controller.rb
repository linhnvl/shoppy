class ApplicationController < ActionController::API
  def authorize_request
    token = request.headers["Authorization"]
    @decoded = JsonWebToken.decode(token)
  rescue JWT::DecodeError => e
    render json: {errors: e.message}, status: :unauthorized
  end
end
