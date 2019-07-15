class ResetPasswordService < ApplicationService
  def initialize authenticable, password
    @authenticable = authenticable
    @password = password
  end

  def call
    @authenticable.update! password: @password
    AuthenticationService.call @authenticable, @password
  end
end
