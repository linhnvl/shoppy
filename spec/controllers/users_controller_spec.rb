require "rails_helper"
require "helpers/valid_json_helper.rb"
require "helpers/create_token_helper.rb"

RSpec.describe Api::UsersController, type: :controller do
  include ValidJsonHelper
  include CreateTokenHelper

  context "when edit user success" do
    let(:user){create :user}

    subject{get :edit, params: {id: user.id}}

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when edit user failure" do
    let(:user){create :user}

    subject{get :edit, params: {id: 5}}

    before{authorize_token(user.id)}

    it "has 404 status code" do
      expect(subject.status).to eq 404
    end
  end

  context "when update user success" do
    let(:user){create :user}

    subject do
      patch :update, params: {id: user.id, address: "LTK", city: "Da Nang", name: "Luat"}
    end

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when update user failure" do
    let(:user){create :user}

    subject{patch :update, params: {id: user.id, address: "LTK", city: "Da Nang", name: "Luat", image: "image"}}

    before{authorize_token(user.id)}

    it "has 401 status code" do
      expect(subject.status).to eq 401
    end
  end

  context "when user not authorize request" do
    let(:user){create :user}

    subject{patch :update, params: {id: user.id, address: "LTK", city: "Da Nang", name: "Luat"}}

    it "has 401 status code" do
      expect(subject.status).to eq 401
    end
  end
end
