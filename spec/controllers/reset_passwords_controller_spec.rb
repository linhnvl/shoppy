require "rails_helper"
require "helpers/valid_json_helper.rb"
require "helpers/create_token_helper.rb"

RSpec.describe Api::ResetPasswordsController, type: :controller do
  include ValidJsonHelper
  include CreateTokenHelper

  let(:password){ "Abcd1234" }
  let(:user){ create :user, password: password, password_confirmation: password }
  let(:headers){ {Authorization: JsonWebToken.encode({user_id: user.id}, 2.hours.from_now)} }

  context "when success" do
    let(:new_password){ "Abcd11111" }
    before(:each) do
      request.headers.merge! headers
      put :update, params: {password: new_password}
    end

    it "has 200 status code" do
      expect(response.status).to eq(200)
    end
  end

  context "when failed" do
    let(:new_password){ "A" }
    before(:each) do
      request.headers.merge! headers
      put :update, params: {password: new_password}
    end

    it "has 401 status code" do
      expect(response.status).to eq(422)
    end
  end

  context "when token is valid" do
    subject{get :edit, params: {id: user.id, token: create_valid_token(user.id)}}

    it "has 200 status code" do
      expect(subject.status).to eq(200)
    end

    it "has responds user data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when token is invalid" do
    subject{get :edit, params: {id: user.id, token: create_invalid_token(user.id)}}

    it "has 401 status code" do
      expect(subject.status).to eq(401)
    end

    it "has responds a message as json" do
      expect(valid_json? subject.body).to be true
    end
  end
end
