require "rails_helper"
require "helpers/sessions_controller_helper.rb"

RSpec.describe SessionsController, type: :controller do
  include SessionsControllerHelper

  context "when login success" do
    let(:password){"Abcd1234"}
    let(:user){create :user, password: password, password_confirmation: password}
    subject{post :create, params: {"email": user.email, "password": password}}

    it "has 200 status code" do
      expect(subject.status).to eq(200)
    end
    it "has responds user data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when login fail" do
    subject{post :create, params: {"email": "foo@bar.com", "password": "Abcd123"}}
    it "has 401 status code" do
      expect(subject.status).to eq(401)
    end
    it "has responds message as json" do
      expect(valid_json? subject.body).to be true
    end
  end
end
