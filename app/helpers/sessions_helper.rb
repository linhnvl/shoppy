module SessionsHelper
  def render_unauthenticated_error
    render json: {error: "unauthenticated"}, status: :unauthenticated
  end

  def render_authenticated object, role = ""
    exp = params[:remember_me] == "true" ? Settings.exp.remember : Settings.exp.no_remember
    token = JsonWebToken.encode({user_id: object.id}, exp)
    data = UserSerializer.new(object, params: {token: token, role: role}).serializable_hash
    render json: data
  end
end
