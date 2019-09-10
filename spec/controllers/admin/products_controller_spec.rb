require "rails_helper"
require "helpers/valid_json_helper.rb"
require "helpers/create_token_helper.rb"

RSpec.describe Api::Admin::ProductsController, type: :controller do
  include ValidJsonHelper
  include CreateTokenHelper

  let(:user){create :user}
  let(:product){create :product}
  let(:category){create :category}

  context "when create product success" do
    subject do
      post :create, params: {name: "T-Shirt", price: 78, information: "A new shirt", quantity: 15,
                             category_ids: [category.id]}
    end

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when create product raise exception record invalid" do
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

  context "when get edit success" do
    subject{get :edit, params: {id: product.id}}

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when get edit failure" do
    subject{get :edit, params: {id: 5}}

    before{authorize_token(user.id)}

    it "has 404 status code" do
      expect(subject.status).to eq 404
    end
  end

  context "when update product success" do
    subject do
      patch :update, params: {id: product.id, name: "Jean", price: 10, quantity: 10, information: "Lorem Ipsum",
                              category_ids: [category.id]}
    end

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when update product failure" do
    subject do
      patch :update, params: {id: product.id, name: "Jean", price: "", quantity: 10, information: "Lorem Ipsum"}
    end

    before{authorize_token(user.id)}

    it "has 422 status code" do
      expect(subject.status).to eq 422
    end
  end

  context "when user not authorize request" do
    subject do
      patch :update, params: {id: product.id, name: "Jean", price: 10, quantity: 10, information: "Lorem Ipsum"}
    end

    it "has 401 status code" do
      expect(subject.status).to eq 401
    end
  end

  context "when get index success" do
    let(:products){create_list :product, 2}

    subject{get :index, params: {page: 1, per_page: 5}}

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when search product success" do
    let!(:products){create_list :product, 5, name: "Copper Clock"}

    subject{get :index, params: {keyword: "Clock"}}

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds data as json" do
      expect(valid_json? subject.body).to be true
    end

    it "has responds 2 results " do
      data = JSON.parse(subject.body).symbolize_keys
      expect(data[:total]).to eq 5
    end
  end

  context "when delete product success" do
    subject{delete :destroy, params: {id: product.id}}

    before{authorize_token(user.id)}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds data as json" do
      expect(valid_json? subject.body).to be true
    end
  end
end
