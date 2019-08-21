module CreateTokenHelper
  def create_valid_token id
    exp = 6.hours.from_now
    JsonWebToken.encode({user_id: id}, exp)
  end

  def create_invalid_token id
    exp = 0
    JsonWebToken.encode({user_id: id}, exp)
  end

  def authorize_token id
    request.headers.merge! Authorization: create_valid_token(id)
  end
end
