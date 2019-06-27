module SessionsHelper
  def render_unauthorize_error
    render json: {error: "unauthorized"}, status: :unauthorized
  end
end
