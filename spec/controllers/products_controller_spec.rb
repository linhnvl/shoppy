require 'rails_helper'
require "helpers/valid_json_helper.rb"
require "helpers/create_token_helper.rb"

RSpec.describe Api::ProductsController, type: :controller do
  include ValidJsonHelper
  include CreateTokenHelper

  context "when create product success" do
    let(:user){create :user}

    subject{post :create, params: {name: "T-Shirt", price: 78, information: "A new shirt", quantity: 15}}

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when create product raise exception record invalid" do
    let(:user){create :user}

    subject{post :create, params: {name: "T-Shirt", price: 78, information: "A new shirt"}}

    before{authorize_token(user.id)}

    it "has 422 status code" do
      expect(subject.status).to eq 422
    end
  end

  context "when create product raise exception attach image error" do
    subject{post :create, params: {name: "T-Shirt", price: 78, information: "A new shirt", quantity: 15, images: "aaa"}}

    it "has 401 status code" do
      expect(subject.status).to eq 401
    end
  end

  context "when product not authorize request" do
    subject{post :create, params: {name: "T-Shirt", price: 78, information: "A new shirt", quantity: 15}}

    it "has 401 status code" do
      expect(subject.status).to eq 401
    end
  end
end
