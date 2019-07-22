module HandleRequestHelper
  def authorize_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    @decoded_data = JsonWebToken.decode(header)
  rescue JWT::DecodeError => e
    render json: {message: e.message}, status: :unauthorized
  end

  def set_locale
    locale = extract_locale_from_header
    I18n.locale = locale_valid?(locale) ? locale : :en
  end

  private
  def locale_valid? locale
    I18n.available_locales.map(&:to_s).include?(locale)
  end

  def extract_locale_from_header
    accept_language = request.env["HTTP_ACCEPT_LANGUAGE"]
    return unless accept_language

    accept_language.scan(/^[a-z]{2}/).first
  end
end
