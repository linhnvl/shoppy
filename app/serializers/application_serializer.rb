class ApplicationSerializer
  include FastJsonapi::ObjectSerializer

  class << self
    def expose_attachments attr
      attribute attr do |object|
        object.public_send(attr).map do |image|
          Rails.application.routes.url_helpers.url_for image
        end
      end
    end
  end
end
