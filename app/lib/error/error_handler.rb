module Error
  module ErrorHandler
    def self.included clazz
      clazz.class_eval do
        rescue_from CustomError do |e|
          respond e.status, e.message
        end
      end
    end

    private
    def respond status, message
      render json: {message: message}, status: status
    end
  end
end
