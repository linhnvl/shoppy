class ApplicationSerializer
  class << self
    def expose_attachments attrs
      attribute attrs do |object|
        object.send(attrs).attachments.map do |image|
          Rails.application.routes.url_helpers.url_for image
        end
      end
    end
  end
end
